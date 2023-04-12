<template>
  <div class="shoplist">
    <div v-for="shop in this.$store.state.shops" v-bind:key="shop.id">
      <div v-on:click.prevent="setActiveShop(shop), $emit('opensidebar')">{{shop.shop + " " + shop.address}}</div>
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

<style>
</style>