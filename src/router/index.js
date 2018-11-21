import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Dashboard from '@/components/Dashboard'
import EchartDemo from '@/components/EchartDemo'
import Management from '@/components/Management'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/home',
      name: 'Home',
      component: Home
    },
    {
      path: '/EchartDemo',
      name: 'EchartDemo',
      component: EchartDemo
    },
    {
      path: '/Management',
      name: 'Management',
      component: Management
    }
  ]
})
