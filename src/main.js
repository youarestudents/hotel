import Vue from 'vue'
import App from './App.vue'
//引入VueRouter
import VueRouter from 'vue-router'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import moment from 'moment'

import axios from 'axios'
Vue.config.productionTip = false
Vue.use(VueRouter)
Vue.use(ElementUI);

Vue.filter('datefmt',function (input,fmtstring) {//当input为时间戳时，需转为Number类型
  // 使用momentjs这个日期格式化类库实现日期的格式化功能
  return moment(input).format(fmtstring);

})
new Vue({
  render: h => h(App),
  beforeCreate(){
    Vue.prototype.$bus=this
 },
  router,
  axios
}).$mount('#app')
