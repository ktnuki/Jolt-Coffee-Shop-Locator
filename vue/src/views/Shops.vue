<template>
  <div>
      <div>
    <b-sidebar  v-model="isSideBarOpen" id="sidebar-variant" title="Sidebar" bg-variant="dark" text-variant="light" shadow>
      <div class="px-3 py-2">
        <shop-details />
      </div>
    </b-sidebar>
  </div>
      <shop-list @opensidebar="toggleSidebar()"/>
  </div>
</template>

<script>
import ShopDetails from '../components/ShopDetails.vue'
import ShopList from '../components/ShopList.vue'

export default {
    components: {
        ShopList,
        ShopDetails
    },
    data(){
      return{
        isSideBarOpen: false
      }
    },
    methods: {
        toggleSidebar() {
            this.isSideBarOpen = !this.isSideBarOpen;
        }
    }

}
</script>

<style>


</style>