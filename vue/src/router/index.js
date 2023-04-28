import { createRouter, createWebHistory } from 'vue-router'
import Layout from '../layout/Layout.vue'
import UserLayout from "@/layout/UserLayout";

const routes = [
  {
    path: '/man',
    name: 'Layout',
    component: Layout,
    redirect:"/man/user",
    children:[{
      path: '/man/user',
      name: 'User',
      component: () => import("@/views/UserMan")
    }, {
      path: '/man/brandman',
      name: 'BrandMan',
      component: () => import("@/views/PetKindGuanli")
    }, {
      path: '/man/PetHealthGuanli',
      name: 'PetHealthGuanli',
      component: () => import("@/views/PetHealthGuanli")
    }, {
      path: '/man/person',
      name: 'Person',
      component: () => import("@/views/Person")
    }, {
      path: '/man/PetKindGuanli',
      name: 'PetKindGuanli',
      component: () => import("@/views/PetKindGuanli")
    }, {
      path: '/man/PetUnitGuanli',
      name: 'PetUnitGuanli',
      component: () => import("@/views/PetUnitGuanli")
    }, {
      path: '/man/PetAdoptionGuanli',
      name: 'PetAdoptionGuanli',
      component: () => import("@/views/PetAdoptionGuanli")
    }, {
      path: '/man/PetGoodsGuanli',
      name: 'PetGoodsGuanli',
      component: () => import("@/views/PetGoodsGuanli")
    }, {
      path: '/man/PetBlogGuanli',
      name: 'PetBlogGuanli',
      component: () => import("@/views/PetBlogGuanli")
    }, {
      path: '/man/PetOrdersGuanli',
      name: 'PetOrdersGuanli',
      component: () => import("@/views/PetOrdersGuanli")
    }
    ]
  }, {
    path: '/man/login',
    name: 'Login',
    component: () => import("@/views/Login")
  }, {
    path: '/userlogin',
    name: 'UserLogin',
    component: () => import("@/views/UserLogin")
  }, {
    path: '/userloginphone',
    name: 'UserLoginPhone',
    component: () => import("@/views/UserLoginPhone")
  }, {
    path: '/register',
    name: 'Register',
    component: () => import("@/views/Register")
  }, {
    path: '/userregister',
    name: 'UserRegister',
    component: () => import("@/views/UserRegister")
  }, {
    path: '/',
    name: 'UserLayout',
    component: UserLayout,
    redirect:"/index",
    children: [{
      path: 'index',
      name: 'Index',
      component: () => import("@/views/Index")
    },{
      path: '/adoption',
      name: 'Adoption',
      component: () => import("@/views/Adoption")
    },{
      path: '/adoptionpet',
      name: 'AdoptionPet',
      component: () => import("@/views/AdoptionPet")
    }, {
      path: '/blog',
      name: 'Blog',
      component: () => import("@/views/Blog")
    }, {
      path: '/blogdetail',
      name: 'BlogDetail',
      component: () => import("@/views/BlogDetail")
    }, {
      path: '/petai',
      name: 'PetAI',
      component: () => import("@/views/PetAI")
    }, {
      path: '/buypet',
      name: 'Buypet',
      component: () => import("@/views/Buypet")
    }, {
      path: '/petbaike',
      name: 'Petbaike',
      component: () => import("@/views/Petbaike")
    }, {
      path: '/PetSearch',
      name: 'PetSearch',
      component: () => import("@/views/PetSearch")
    }, {
      path: '/userperson',
      name: 'UserPerson',
      component: () => import("@/views/UserPerson")
    }, {
      path: '/PetPurchase',
      name: 'PetPurchase',
      component: () => import("@/views/PetPurchase")
    },
    ]
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
