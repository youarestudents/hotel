import VueRouter from 'vue-router'
import About from '../view/about.vue'
import User from "../view/user.vue"
import Dinggou from "../view/dinggou.vue"
import Service from "../view/service.vue"
import Ushow from '@/view/ushow.vue'
import Manager from '@/view/manager.vue'
import Mshow from '@/view/mshow.vue'
import Shuju from '@/view/shuju.vue'
import Xiugai from '@/view/xiugai.vue'
import Hstate from '@/view/hstate.vue'
import Showu from '@/view/showu.vue'
import Ad from '@/view/advertisement.vue'
//创建并暴露一个路由器

export default new VueRouter({
    routes: [
       
        {
            path: "/ushow",
            redirect: to => {
              if (to.path !== '/user') {
                return "/user";
              }
            }
          },

       
        {
        
            path: "/ushow",
            component: Ushow,
            children: [{
                    path: '/dinggou',
                    component: Dinggou
                },
                {
                    path: "/service",
                    component: Service
                },
                {
                    path: '/about',
                    component: About
                },
                {
                    path: '/user',
                    name:"user",
                    component: User
                },
                {
                  path:'/hstate',
                  component:Hstate
                }

            ]

        },
        {
            path: "/manager",
            redirect: to => {
              if (to.path !== '/mshow') {
                return "/mshow";
              }
            }
          },
        {
            path:'/manager',
            component:Manager,
            children:[
                {
                    path:"/mshow",
                    component:Mshow
                },{
                    path:'/shuju',
                    component:Shuju
                },{
                      path:"/xiugai",
                      component: Xiugai
                
                },{
                    path:'/showu',
                    component:Showu

                },{
                  path:'/ad',
                  component:Ad
                }

            ]
        }
       
       

    ]
})