<template>
  <div class="shopdetails">
      <h1>Shop Details</h1>
        <div v-for="shop in this.$store.state.shops" v-bind:key="shop.id">
    <router-link v-on:click.prevent="setActiveShop()" v-bind:to="{ name: 'details', params: {id: shop.id} }"></router-link>
    <h2>{{ shop.shop }}</h2>
    </div>
      <img src="#" alt="">


  </div>
</template>

<script>
export default {
    name: 'shop-details',

}
</script>

<style>

</style>