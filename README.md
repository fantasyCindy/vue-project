# 约投顾移动端项目

> 项目使用 vue + vue-router + vuex 技术栈开发, 注意开发过程中不能随意使用第三方库, 也不能使用 jQuery 框架

## 打包(开发环境)

* node config/webpack key=m

## 打包(生产环境)

* node config/webpack key=m env=production

## 相关目录说明

* 路由级别页面放在 pages 文件夹
* 公共的组件放在 pages/common
* api.js : 所有接口写在这里
* fn.js : 无依赖的工具函数
* enum.js : 所有结构体
* router.js : 页面路由
* store.js : 状态管理
