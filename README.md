# flutter_practice

一个[Flutter](https://flutter.dev/) 练习项目，包含了一些移动端工程化的一些常用能力，可以上手使用和学习。

## 包结构

```
lib # Flutter代码根目录
├── common              # 一些跨页面共享的代码
├── component           # 一些封装的页面通用组件，如webview等
│    └── async_loader   # 封装的异步加载的组件
├── di                  # 依赖注入
├── navigation          # 页面路由
├── network             # 网络相关代码
│    ├── animal         # 请求猫猫狗狗图
│    ├── feed           # 请求wanandroid接口
│    └── moments        # 请求某网站接口
├── pages               # 页面部分        
│    ├── animal         # 猫猫狗狗页面
│    ├── article        # 文章页面，利用bloc模式
│    │    ├── bloc      # bloc层代码
│    │    ├── data      # 数据层代码
│    │    └── ui        # ui层代码    
│    ├── count          # 简单加数页面
│    ├── feed           # 数据页面和点击进入webview
│    └── moments        # 类朋友圈页面
├── res                 # 资源相关
│    ├── string         # 字符串资源
│    └── theme          # 主题样式资源
└── storage             # 持久化代码

```

## 涉及架构
项目中有使用MVVM架构和BLOC架构。

- 在pages里的animal部分是使用的MVVM构架：

|      | View                | ViewModel                    | Model                          |
| ---- | ------------------- | ---------------------------- | ------------------------------ |
| 代码 | page.dart           | controller.dart              | repository.dart(api, model...) |
| 职责 | 用于渲染UI          | 用于管理状态和状态相关的逻辑 | 用于数据相关的逻辑             |
| 构成 | UI内部状态 + Widget | 业务状态 + UI事件响应        | 数据存取、缓存策略...          |

- 在pages里的feed部分也是使用的MVVM构架，只是用flutter的provider代替了Getx的controller。

- 在pages里的article部分是使用的Bloc构架。

## 封装对页面异步加载代码
这部分代码在`lib/component/async_loader`中，其目标是让页面不必处理异步加载的逻辑，只需要关注数据成功加载后的UI渲染即可。
`AsyncLoadProcessor`负责异步加载的UI渲染，它会根据`LoadState`的状态来显示不同的UI，刷新再次请求等操作也是通过`obx`和更新`LoadState`来进行页面刷新的。
`LoadState`的状态有以下几种：
1. `Idle`：表示未开始加载的空状态，此时不会显示任何内容
2. `Loading`：表示正在加载中，此时默认会显示`LoadingPlaceholder`，若`loadingView`不为空，则会显示`loadingView`
3. `Success`：表示加载成功，此时会显示`content`中传入的Widget，一般此处传入的Widget才是页面真正的主体内容
4. `Failure`：表示加载失败，此时默认则会显示`ErrorPlaceholder`，若`errorView`不为空，则会显示`errorView`

`AsyncLoadController`是`AsyncLoadProcessor`的controller，它负责处理异步加载的逻辑。它的构造函数中需要传入一个`DataController`，
`AsyncLoadController`并且会调用`DataController`的`fetch`方法来获取数据，并且会根据`fetch`的执行结果来更新`LoadState`的状态。
`AutoLoadController`是通过`onInit`调用父类的`load`方法完成自动加载的，如果你不希望你的页面用自动请求数据，则无需用`AutoLoadController`。

`DataController`是一个抽象类，它的子类需要实现`fetch`方法，`fetch`方法需要返回一个`Future`。
`DataController`是页面真正主体（即上面提到的`content`）对应的controller，它虽然要实现`fetch`方法，但它不负责获取数据，
它只用关心数据成功加载后的业务逻辑。

`AsyncLoadProcessor`还有一个`useRefresh`属性来控制是否需要刷新功能。对应`AsyncLoadController`的`refresh`。

封装结构大致如图:
![pPUNn0J.md.png](https://s1.ax1x.com/2023/08/27/pPUNn0J.md.png)

## 测试
- `/test` 目录中有对MVVM架构controller部分和BLOC架构的bloc部分的单元测试代码。

## 依赖库使用
- 项目很多功能基于[GetX](https://pub.dev/packages/get)，如依赖注入、路由管理、状态管理(controller)等功能。
- 网络部分使用的是，[Dio](https://pub.dev/packages/dio) + [retrofit](https://pub.dev/packages/retrofit) +
[json_serializable](https://pub.dev/packages/json_serializable)的组合。
- 项目中持久化使用[hive](https://pub.dev/packages/hive)，没具体使用。

## 其他
- 一些环境变量放在根目录下的config目录的文件之中。