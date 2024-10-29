<template>
    <div class="modal-content">
                      <table style="width: 100%;" class="text-center table">
                          <tr>
                              <th>HÌNH</th>
                              <th>SẢN PHẨM</th>
                              <th>Đơn giá</th>
                              <th>Số lượng</th>
                              <th>Tiền</th>
                              <th></th>
                          </tr>
                          <!-- dùng v-for thể hiện giỏ hàng -->
                          <tr v-for="item in cart" :key="item.id">
                              <td><img :src="item.image" style="height: 100px;width: 100px;"></td>
                              <td class="align-middle">{{item.name}}</td>
                              <td class="align-middle">{{item.price}}</td>
                              <td class="align-middle">{{item.quantity}}</td>
                              <td class="align-middle">{{item.price*item.quantity}}</td>
                              <td class="align-middle"><button class="btn btn-danger" @click="removeCart(item.id)" >Remove
                                      {{ item.id }}</button></td>
                          </tr>
                          <tr>
                              <th>
                              </th>
                              <th></th>
                              <th>Tổng tiền</th>
                              <th>tính tổng tiền ở dây</th>
                              <th>
                                  tong tien
                              </th>
                              <th><button class="btn btn-danger" >Xóa hết : !</button>
                              </th>
                          </tr>
                      </table>
                  </div>
  </template>
  
  <script>
  import cart from '../data/cart'
  export default {
      data(){
          return{
          
          cart:cart
          }
      },
      methods: {
        removeCart(id) {
            this.cart.filter(item => item.id != id);
        }
      }
  }
  </script>
  
  <style>
  
  </style>