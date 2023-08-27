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

- 在pages里的feed部分也是使用的MVVM构架，只是用flutter的provider代替了Getx的controller

- 在pages里的article部分是使用的Bloc构架。

## 测试
- 代码中有对MVVM架构controller部分和BLOC架构的bloc部分的单元测试代码

## 依赖库使用
- 项目很多功能基于[GetX](https://pub.dev/packages/get)，如依赖注入、路由管理、状态管理(controller)等功能。
- 网络部分使用的是，[Dio](https://pub.dev/packages/dio) + [retrofit](https://pub.dev/packages/retrofit) +
[json_serializable](https://pub.dev/packages/json_serializable)的组合。
- 项目中持久化使用[hive](https://pub.dev/packages/hive)，没具体使用。

## 其他
- 一些环境变量放在根目录下的config目录的文件之中。