import Vue from 'vue'
import Router from 'vue-router'

// Containers
import Full from '@/containers/Full'

// Views
import Dashboard from '@/views/Dashboard'

// Views - Pages
import Page404 from '@/views/pages/Page404'
import Page500 from '@/views/pages/Page500'
import Login from '@/views/pages/Login'
import Logout from '@/views/pages/Logout'
import Register from '@/views/pages/Register'
import Pos from '@/views/pages/Pos'

//Views - References
import departments from '@/views/references/Departments'
import categories from '@/views/references/Categories'
import units from '@/views/references/Units'
import cardtypes from '@/views/references/Cardtypes'
import checktypes from '@/views/references/Checktypes'
import gctypes from '@/views/references/Gctypes'
import menus from '@/views/references/Menus'
import suppliers from '@/views/references/Suppliers'
import discounttypes from '@/views/references/Discounttypes'
import products from '@/views/references/Products'
import inventorytypes from '@/views/references/inventorytypes'

//Views - Inventory
import purchasemains from '@/views/inventory/Purchasemains'
import receivingmains from '@/views/inventory/Receivingmains'
import issuance from '@/views/inventory/issuance'
import adjustmentmains from '@/views/inventory/Adjustmentmains'

import store from '../store'
Vue.use(Router)

const router = new Router({
  mode: 'hash', // Demo is living in GitHub.io, so required!
  linkActiveClass: 'open active',
  scrollBehavior: () => ({ y: 0 }),
  routes: [
    
    {
      path: '/',
      redirect: 'dashboard',
      name: 'Home',
      component: Full,
      children: [
        {
          path: 'dashboard',
          name: 'Dashboard',
          component: Dashboard,
          meta: { requiresAuth: true },
        },
        {
          path: 'references',
          name: 'References',
          component: {
            render (c) { return c('router-view') }
          },
          children: [
            {
              path: 'departments',
              name: 'Departments',
              component: departments,
              meta: {requiresAuth: true}
            },
            {
              path: 'categories',
              name: 'Categories',
              component: categories,
              meta: {requiresAuth: true}
            },
            {
              path: 'units',
              name: 'Units',
              component: units,
              meta: {requiresAuth: true}
            },
            {
              path: 'cardtypes',
              name: 'Cardtypes',
              component: cardtypes ,
              meta: {requiresAuth: true}
            },
            {
              path: 'checktypes',
              name: 'Checktypes',
              component: checktypes ,
              meta: {requiresAuth: true}
            },
            {
              path: 'gctypes',
              name: 'Gctypes',
              component: gctypes ,
              meta: {requiresAuth: true}
            },
            {
              path: 'menus',
              name: 'Menus',
              component: menus ,
              meta: {requiresAuth: true}
            },
            {
              path: 'inventorytypes',
              name: 'Inventorytypes',
              component: inventorytypes ,
              meta: {requiresAuth: true}
            },
            {
              path: 'suppliers',
              name: 'Suppliers',
              component: suppliers ,
              meta: {requiresAuth: true}
            },
         
          {
            path: 'discounttypes',
            name: 'Discounttypes',
            component: discounttypes ,
            meta: {requiresAuth: true}
          },
          {
            path: 'products',
            name: 'Products',
            component: products ,
            meta: {requiresAuth: true}
          },
          ]
        },

               {
          path: 'inventory',
          name: 'Inventory',
          component: {
            render (c) { return c('router-view') }
          },
          children: [
            {
              path: 'purchasemains',
              name: 'Purchase Order List',
              component: purchasemains,
              meta: {requiresAuth: true}
            },
            {
                path: 'receivingmains',
                name: 'Receiving List',
                component: receivingmains,
                meta: {requiresAuth: true}
            },
            {
              path: 'issuance',
              name: 'Issuance',
              component: issuance,
              meta: {requiresAuth: true}
            },
            {
              path: 'adjustmentmains',
              name: 'Adjustment List',
              component: adjustmentmains,
              meta: {requiresAuth: true}
            },

            
            // {
            //   path: 'user_groups',
            //   name: 'User Groups',
            //   component: usergroups,
            //   meta: {requiresAuth: true, rights: '11-41'}
            // },
            // {
            //   path: 'company_settings',
            //   name: 'Company Settings',
            //   component: companysettings,
            //   meta: {requiresAuth: true, rights: '12-45'}
            // }
          ]
        },

      ]
    },
    {
      path: '/register',
      name: 'Register',
      component: Register
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/logout',
      name: 'Logout',
      component: Logout
    },
    {
      path: '/Pos',
      name: 'Pos',
      component: Pos
    },
    {
      path: '*',
      name:'404', 
      component: Page404
    },
   
  ]
})
export default router
router.beforeEach((to, from, next) => {

  // check if the route requires authentication and user is not logged in
  if (to.matched.some(route => route.meta.requiresAuth) && !store.state.isLoggedIn) {
    // redirect to login page
    next({ name: 'Login' })
    return
  }

// if logged in redirect to dashboard
  if(to.path === '/login' && store.state.isLoggedIn) {
      next({name: from.name})
      return
  }

next()
})
