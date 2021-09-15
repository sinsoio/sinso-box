import Vue from 'vue'
import axios from 'axios'

import App from './App'
import router from './router'
import store from './store'
import VueI18n from 'vue-i18n'
// element
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

if (!process.env.IS_WEB) Vue.use(require('vue-electron'))
Vue.http = Vue.prototype.$http = axios
Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(VueI18n)
import './styles'
import zh from '../renderer/i18n/zh'
import en from '../renderer/i18n/en'
const i18n = new VueI18n({
  // 从本地存储中取，如果没有默认为中文，
  // 这样可以解决切换语言后，没记住选择的语言，刷新页面后还是默认的语言
  // locale: localStorage.getItem('lang') || 'zh',
  locale: 'zh',
  messages: {
    zh,
    en,
  },
  silentTranslationWarn: true,
})
/* eslint-disable no-new */
new Vue({
  components: { App },
  router,
  store,
  i18n,
  template: '<App/>',
}).$mount('#app')
