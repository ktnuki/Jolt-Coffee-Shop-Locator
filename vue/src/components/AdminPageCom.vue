<template>
  <div>
    <h1 id="coffee-shops-header" class="fancy-text bottom-border">
      Coffee Shops
    </h1>
    <div class="shoplist">
      <div v-for="shop in adminShopListMethod()" v-bind:key="shop.shopId">
        <button @click.prevent="evaluateIsApproved(shop)">
          {{ displayIsApproved(shop.approved) }}
        </button>
        <button @click.prevent="deleteShop(shop.shopId)">Delete</button>
        <div class="shop">
          {{ shop.shop }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ShopService from "../services/ShopService";
export default {
  name: "admin-page",
  data() {
    return {
      adminShopList: [],
    };
  },
  methods: {
    adminShopListMethod(){
        return this.adminShopList;
    },
    evaluateIsApproved(shop) {
        console.log(shop.shopId)
      if (shop.approved == false) {
        this.approved(shop.shopId);
      } else if (shop.approved == true) {
        this.unApproved(shop.shopId);
      }
    },
    displayIsApproved(boo) {
      if (boo == true) {
        return "UnApprove";
      } else {
        return "Approve";
      }
    },
    approved(shopId) {
      ShopService.approved(shopId)
      .then((response)=>{
        this.adminShopList = response.data;
      })
      .catch((err) => console.error(err));
    },
    unApproved(shopId) {
      ShopService.unApproved(shopId)
      .then((response) => {
            this.adminShopList = response.data;
          })
          .catch((err) => console.error(err));
    },
    getAdminList(){
        ShopService.getAdminShopsList()
          .then((response) => {
            this.adminShopList = response.data;
          })
          .catch((err) => console.error(err));
    },
    deleteShop(shopId){
        ShopService.deleteShop(shopId)
        .then((response) => {
            this.adminShopList = response.data;
          })
          .catch((err) => console.error(err));
    },
  },
  created() {
   this.getAdminList();
  },
};
</script>

<style>
.shoplist {
  text-align: left;
}
</style>