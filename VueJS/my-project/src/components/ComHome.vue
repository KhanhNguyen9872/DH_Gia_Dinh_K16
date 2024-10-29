<template>

    <h1>TẤT CẢ SẢN PHẨM</h1>
    <Product v-for="item in products" :key="item.id" :product="item"/>
</template>

<script>
import Product from './ComProduct.vue'
import items from '../data/items'
export default {
    name:'ComHome',
    components:{
      Product
    },
    data(){
      return{
        products:items
      }
    }
}
</script>

<style>

</style>