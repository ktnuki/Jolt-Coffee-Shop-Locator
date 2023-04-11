<template>
  <div>
    <div>
      <b-sidebar
        v-model="isSideBarOpen"
        id="sidebar-variant"
        bg-variant="dark"
        text-variant="light"
        aria-labelledby="sidebar-no-header-title"
        no-header
        shadow
      >
        <div class="px-3 py-2">
          <h4 id="sidebar-no-header-title">{{ this.$store.state.activeShop.shop }}</h4>
          <shop-details />
        </div>
      </b-sidebar>
    </div>
    <shop-list @opensidebar="toggleSidebar()" />
  </div>
</template>

<script>
import ShopDetails from "../components/ShopDetails.vue";
import ShopList from "../components/ShopList.vue";

export default {
  components: {
    ShopList,
    ShopDetails,
  },
  data() {
    return {
      isSideBarOpen: false,
    };
  },
  methods: {
    toggleSidebar() {
      this.isSideBarOpen = !this.isSideBarOpen;
    },
  },
  computed: {
  },
};
</script>

<style>
</style>