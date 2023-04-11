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
    return {};
  },
  created() {
      ShopService.getShopsList().then((response) => {
          this.$store.commit('SET_SHOPS', response.data)
      })
      .catch(err => console.error(err));
  },
  methods: {
      setActiveShop(shop) {
          return this.$store.commit('SET_ACTIVE_SHOP', shop);
      }
  }
};
</script>

<style>
</style>