## flutter doctor -v 找到 jre 地址

```bash
• Java binary at: E:\flutter\Android\jre\bin\java
```

##输入以下命令

```bash
E:\flutter\Android\jre\bin\keytool -genkey -v -keystore D:\key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

##项目目录下的 android 文件夹下，创建一个名为 key.properties 的文件

```bash
storePassword=<password from previous step>    //输入上一步创建KEY时输入的 密钥库 密码
keyPassword=<password from previous step>    //输入上一步创建KEY时输入的 密钥 密码
keyAlias=key
storeFile=<E:/key.jks>    //key.jks的存放路径
```

## 进入项目目录的/android/app/build.gradle 文件，在 android{这一行前面,加入如下代码：

```bash
def keystorePropertiesFile = rootProject.file("key.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
```

## 把如下代码进行替换

```bash
buildTypes {
  release {
    signingConfig signingConfigs.debug
  }
}
```

替换成

```bash
signingConfigs {
  release {
    keyAlias keystoreProperties['keyAlias']
    keyPassword keystoreProperties['keyPassword']
    storeFile file(keystoreProperties['storeFile'])
    storePassword keystoreProperties['storePassword']
  }
}
buildTypes {
  release {
    signingConfig signingConfigs.release
  }
}
```

## 直接在终端中输入：

```bash
flutter build apk
```
