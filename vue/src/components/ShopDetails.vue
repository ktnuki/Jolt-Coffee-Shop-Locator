<template>
  <div class="shopdetails" >
    Hello
    {{ currentshop.address }}
    {{ currentshop.shop }}
    {{ currentshop.rating }}
  </div>
</template>

<script>
export default {
  name: "shop-details",
  data() {
    return {
    
    }
  },
  computed: {
    currentshop(){
      return this.$store.state.activeShop;
    }
  }
}
</script>

<style>
</style>