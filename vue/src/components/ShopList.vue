<template>
  <div>
    <div>
     <!--  <img v-if="isFilterList" class="image" src="../assets/generic1.png" alt="" />
      <img v-if="!isFilterList" class="image" src="../assets/generic2.png" alt="" /> -->
    </div>
    <div id="nav-buttons">
      <button v-if="!isFilterList" @click="isFilterList = !isFilterList" id="filter-favorites">Filter Favorites</button>
      <button v-if="isFilterList" @click="isFilterList = !isFilterList" id="filter-favorites">List All Shops</button>
      <button id="get-directions">Get Directions</button>
    </div>
    <h1>Coffee Shops</h1>
    <div class="shoplist">
      <div v-for="shop in getFavorites()" v-bind:key="shop.id">
        <div
          class="shop"
          v-on:click.prevent="setActiveShop(shop), $emit('opensidebar')"
        >
          {{ shop.shop + " ~ " + shop.address }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ShopService from "../services/ShopService.js";
export default {
  name: "shop-list",

  data() {
    return {
      favoritesList: [],
      isFilterList: false,
    };
  },
  methods: {
    setActiveShop(shop) {
      return this.$store.commit("SET_ACTIVE_SHOP", shop);
    },
    getFavorites() {
      ShopService.getFavoritesList()
      .then((response) => {
        this.favoritesList = response.data;
      })
      .catch((err) => console.error(err));
      if (this.isFilterList == false) {
        return this.$store.state.shops;
      } else {
        return this.$store.state.shops.filter((shop) => {
          for (let i = 0; i < this.favoritesList.length; i++) {
            let output = this.favoritesList[i].shopId;
            if (shop.shopId == output) {
              return shop;
            }
          }
        });
      }
    },
  },
  created() {
    ShopService.getShopsList()
      .then((response) => {
        this.$store.commit("SET_SHOPS", response.data);
      })
      .catch((err) => console.error(err));

    //pull in favorited list as a local var (optional) or come from store

    //created - make a call to get favorite list & ids
    //use it to filter in computed
    ShopService.getFavoritesList()
      .then((response) => {
        this.favoritesList = response.data;
      })
      .catch((err) => console.error(err));
  },
};
</script>

<style scoped>
.shoplist {
  display: flex;
  flex-direction: column;
  row-gap: 10px;
}
.shop:hover {
  color: #683012;
  cursor: default;
}
.image {
  width: 80%;
  margin-bottom: 20px;
  margin-top: 20px;
  border-radius: 8px;
}
#nav-buttons {
  display: flex;
  justify-content: space-between;
  margin-right: 10%;
  margin-left: 10%;
  margin-bottom: 20px;
}
</style>