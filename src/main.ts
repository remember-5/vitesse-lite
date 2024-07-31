import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router/auto'
import DataVVue3 from '@kjgl77/datav-vue3'
import App from './App.vue'
import '@unocss/reset/tailwind.css'
import './styles/main.css'
import 'uno.css'

const app = createApp(App)
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
})
app.use(DataVVue3)
app.use(router)
app.mount('#app')
