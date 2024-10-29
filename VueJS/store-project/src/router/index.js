import { createWebHistory, createRouter } from "vue-router";

import Home from '@/components/ComHome.vue';
import ThucDon from '@/components/ComThucDon.vue';
import GioiThieu from '@/components/ComGioiThieu.vue';
import LienHe from '@/components/ComLienHe.vue';

//

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home
    }, 
    {
        path: '/thucdon',
        name: 'ThucDon',
        component: ThucDon
    }, 
    {
        path: '/gioithieu',
        name: 'GioiThieu',
        component: GioiThieu
    }, 
    {
        path: '/lienhe',
        name: 'LienHe',
        component: LienHe
    }
];