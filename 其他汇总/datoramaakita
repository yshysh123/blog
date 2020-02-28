# @datorama/akita

@datorama/akita的使用，通常我们需要创建3个类，一个提供输出的基本stote，用于store的储存和提供update方法，另外一个提供store的查询，这个类结合rxjs-hook
的obserable来控制store更新自动触发render，另外一个service类提供store的更新及数据的组装等等工作。

## 常用API

### Store, StoreConfig

Store是状态的一个集合，类似于mobx，redux，vuex里面的store。

```javascript
import { Store, StoreConfig } from '@datorama/akita';
export interface SessionState {
   token: string;
   name: string;
}
export function createInitialState(): SessionState {
  return {
    token: '',
    name: ''
  };
}
@StoreConfig({ name: 'session' })
export class SessionStore extends Store<SessionState> {
  constructor() {
    super(createInitialState());
  }
}
```

借用一下官方的例子，创建了一个名字为session的store，里面含有2个state，其一为token，是string类型，其次为name，也是string，默认两个值都是空字符串。

如果想更新state，session的store给我们提供了一个update方法，有点像react里的setState

```javascript
import { SessionStore } from './session.store';
export class SessionService {
  constructor(private sessionStore: SessionStore) {}

  updateUserName(newName: string) {
    this.sessionStore.update({ name: newName });
  }  
}
```

如上代码，为了保证我们数据的单一流向，建议在对应的service里面去修改store的值。用法如上。

```javascript
import { SessionStore } from './session.store';
 
export class SessionService {
  constructor(private sessionStore: SessionStore) {}

  updateUserName(newName: string) {
    this.sessionStore.update(state => ({
      name: newName
    }));
  }  
}
```
它uptate方法同样可以接收一个回调函数，返回的是一组不可变数据。

### Query

查询是负责将我们store中的数据进行拆解，提取，提供一个直接供我们使用的元素集合。可以理解为数据库的查询。它的构造函数将自己存储以及可能的其他查询类作为参数
进行查询。

```javascript
import { Query } from '@datorama/akita';

export class SessionQuery extends Query<SessionState> {  
  isLoggedIn$ = this.select(state => !!state.token);
  selectName$ = this.select('name');
  multi$ = this.select(['name', 'age']) // { name, age }
  multi$ = this.select([state => state.name, state => state.age]) // [name, age]
  constructor(protected store: SessionStore) {
    super(store);
  }
}
```

如上代码，调用了SessionStore的类，最终输出了4个查询后结果，分别为是否登录-isLoggedIn$，名称-selectName$，以及multi$。
返回的数据，可以直接在react，vue等框架中使用。使用方法如下：

```javascript
import { useObservable } from 'rxjs-hooks'
const topBtnType = useObservable(
  () => chapterListQuery.topButtonType$,
  TopButtonEnum.NONE
)
```
如上代码，在react中使用rxjs的observable变量，我们通过rxjs-hooks来进行一层封装，useObserable可以使我们obserable的变量自动触发派发更新。
第一个参数需要返回一个obserable，第二参数是默认值。具体可参考 https://www.jianshu.com/p/273e7ab02fa1 进行查看。

### service

上文提过，更新state，尽可能的在service中进行更新，所以我们还需要创建一个service的类，用于处理store的逻辑及派发更新工作。看下方例子：

```javascript
import { SessionStore } from './session.store';
import { tap } from 'rxjs/operators';

export class SessionService {
  constructor(private sessionStore: SessionStore, 
              private http: HttpClient) {}
  login(creds) {
    return http.login(creds).pipe(tap(user => {
      this.sessionStore.update(user);
    }));
  }
}
//do、tap ( 窃听 ) 是两个完全相同的操作符，用于窃听Observable的生命周期事件，而不会产生打扰。
```

也是官方推荐的例子，比较简单，主要就提供了一个login方法，作用就是调用接口，在拿到返回值user之后，去更新store里面的user变量。从而更新所有监听到user变量
的依赖。

### EntityState, EntityStore, StoreConfig

1. 创建一个EntityState

```javascript
import { ActiveState,EntityState,EntityStore,StoreConfig } from '@datorama/akita'

export interface TodosState extends EntityState<Todo, number> { 
  filter: string;
}
@StoreConfig({ name: 'todos' })
export class TodosStore extends EntityStore<TodosState> {
  constructor() {
    super({ filter: 'ALL' });
  }
}
```
2. 这样创建一个EntityStore之后，就可以使用对应的api了

#### set
#### add
#### update
#### remove
#### upsert
#### upsertMany
#### replace
#### move
#### setLoading
#### setError
#### destroy

具体使用见 https://netbasal.gitbook.io/akita/entity-store/entity-store/api

3. 创建一个activeState

```javascript
export interface TodosState extends EntityState<Todo>, ActiveState {
}

const initialState = {
  active: null
};

@StoreConfig({ name: 'todos' })
export class TodosStore extends EntityStore<TodosState> {
  constructor() {
    super(initialState);
  }
}
```

#### updateActive
#### setActive
#### selectActiveId
#### selectActive
getter
#### getActiveId()
#### getActive()
#### hasActive()

具体使用见 https://netbasal.gitbook.io/akita/entity-store/entity-store/active-state

### QueryEntity
同理上面

```javascript
import { QueryEntity } from '@datorama/akita';

export class TodosQuery extends QueryEntity<TodosState> {
  constructor(protected store: TodosStore) {
    super(store);
  }
}
```

#### selectAll()
#### getAll()
#### selectActive()
