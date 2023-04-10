<template>
  <div class="shoplist">
    <div v-for="shop in this.$store.state.shops" v-bind:key="shop.id">
    <router-link v-on:click.prevent="setActiveShop()" v-bind:to="{ name: 'shops' }">{{shop.shop + " " + shop.address}}</router-link>
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
      setActiveShop() {
          this.$store.commit('SET_ACTIVE_SHOP', this.shop);
      }
  }
};
</script>

<style>
</style>