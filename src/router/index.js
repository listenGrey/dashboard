import Vue from 'vue'
import VueRouter from 'vue-router'
import DataView from '@/views/index.vue'
import Detail from '@/views/SubDetail.vue'
import FieldMonitor from '@/views/FieldMonitor.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    { path: '/', component: DataView },
    { path: '/detail', component: Detail },
    { path: '/field', component: FieldMonitor }
  ]
})

export default router
