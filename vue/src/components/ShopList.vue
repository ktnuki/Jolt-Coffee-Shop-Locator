<template>
  <div>
    <div >
      <img class="image" src="../assets/generic1.png" alt="">
    </div> 
    <div id="nav-buttons">
      <button id="filter-favorites">Filter Favorites</button>
      <button id="get-directions">Get Directions</button>
    </div>
  <div class="shoplist" >
    <div v-for="shop in this.$store.state.shops" v-bind:key="shop.id">
      <div class="shop" v-on:click.prevent="setActiveShop(shop), $emit('opensidebar')">{{shop.shop + " ~ " + shop.address}}</div>
    </div>
  </div>
  </div>
</template>

<script>
import ShopService from '../services/ShopService.js'
export default {
  name: "shop-list",

  data() {
    return {}
  },
  methods: {
      setActiveShop(shop) {
          return this.$store.commit('SET_ACTIVE_SHOP', shop);
      }
  },
  created() {
      ShopService.getShopsList().then((response) => {
          this.$store.commit('SET_SHOPS', response.data)
      })
      .catch(err => console.error(err));

      //pull in favorited list as a local var (optional) or come from store

      //created - make a call to get favorite list & ids 
      //use it to filter in computed
  }
};
</script>

<style scoped>
.shoplist{
  display: flex;
  flex-direction: column;
  row-gap: 10px; 
}
.shop:hover{
  color: #683012;
  cursor: default;
}
.image{
  width: 80%;
  margin-bottom: 20px;
  margin-top: 20px;
}
#nav-buttons {
  display: flex;
  justify-content: space-between;
  margin-right: 10%;
  margin-left: 10%;
  margin-bottom: 20px;
}

</style>