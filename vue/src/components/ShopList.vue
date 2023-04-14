<template>
  <div>
    <div>
     <!--  <img v-if="isFilterList" class="image" src="../assets/generic1.png" alt="" />
      <img v-if="!isFilterList" class="image" src="../assets/generic2.png" alt="" /> -->
    </div>
    <div id="nav-buttons">
    <!--   <button v-if="!isFilterList" @click="isFilterList = !isFilterList" class="filter-favorites">Filter Favorites</button>
      <button v-if="isFilterList" @click="isFilterList = !isFilterList" class="filter-favorites">List All Shops</button> -->
      <select name="filterDropdown" @change="onChange($event)" class="form-select form-control">
        <option value="">--------Select Option--------</option>
        <option value="filter-by-favorites">Filter By Favorites</option> 
        <option value="filter-by-rating">Filter By Rating</option> 
        <option value="filter-by-distance">Filter By Distance</option> 
      </select>
      <button id="get-directions">Get Directions</button>
      
    </div>

    <h1>Coffee Shops</h1>
    <div class="shoplist">
      <div v-for="shop in getFavorites()" v-bind:key="shop.id">
        <div
          class="shop"
          v-on:click.prevent="setActiveShop(shop), $emit('opensidebar')"
        >
          {{ shop.shop + " ~ " + shop.address + " ~ "}}
          <img
        id="rating2"
        class="highlights"
        src="../assets/brown-single-bean.png"
        alt=""
        title="Positive rating bean"
        v-for="numberOfRating in shop.rating"
        v-bind:key="numberOfRating"
      />
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
      isFilterRating: false,
      selectedValue: '',
    };
  },
  methods: {
    onChange(e){
      return this.selectedValue = e.target.value
    },
    methodToRunOnSelect(payload) {
            this.object = payload;
    },
    setActiveShop(shop) {
      return this.$store.commit("SET_ACTIVE_SHOP", shop);
    },
    getFavorites() {
      ShopService.getFavoritesList()
      .then((response) => {
        this.favoritesList = response.data;
      })
      .catch((err) => console.error(err));
      if ( this.selectedValue == '') {
        return this.$store.state.shops;
      } else if (this.selectedValue == 'filter-by-favorites') {
        return this.$store.state.shops.filter((shop) => {
          for (let i = 0; i < this.favoritesList.length; i++) {
            let output = this.favoritesList[i].shopId;
            if (shop.shopId == output) {
              return shop;
            }
          }
        })
      } else if(this.selectedValue == 'filter-by-rating'){
        let outputArr = this.$store.state.shops; 
        return outputArr.sort((a, b)=>
            b.rating - a.rating
          )
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
  margin-top: 20px;
  margin-right: 10%;
  margin-left: 10%;
  margin-bottom: 20px;
}
.highlights{
  width: 20px;
}
</style>