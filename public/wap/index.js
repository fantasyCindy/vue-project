import Vue from 'vue';
import './component'
import VueRouter from "vue-router";
import { Toast } from 'vant';
Vue.use(VueRouter)
Vue.use(Toast);


import App from './pages/App';
import Register from './pages/Register';
import TeacherCenter from './pages/center/teacherDetail';
import Login from './pages/Login';

import router from "./router";
import store from "./store";

var href = window.location.href
if (href.indexOf("app=yngp") != '-1') {
    document.title = '约牛股票,股票投资服务平台-大盘个股走势,股市直播,行情分析'
}


new Vue({
    el: '#app',
    store,
    router,
    render: (h) => h(App)
});