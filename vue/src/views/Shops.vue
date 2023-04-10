<template>
  <div>
      <div>
    <b-button v-b-toggle.sidebar-variant>Toggle Sidebar</b-button>
    <b-sidebar id="sidebar-variant" title="Sidebar" bg-variant="dark" text-variant="light" shadow>
      <div class="px-3 py-2">
        <shop-details />
      </div>
    </b-sidebar>
  </div>
      <shop-list />
  </div>
</template>

<script>
import ShopDetails from '../components/ShopDetails.vue'
import ShopList from '../components/ShopList.vue'

export default {
    components: {
        ShopList,
        ShopDetails
    }

}
</script>

<style>


</style>