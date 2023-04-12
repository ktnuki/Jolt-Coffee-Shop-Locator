<template>
  <div id="shopdetails" >
    <div id="sidebar-img">
      <!-- <img :src="require(`../assets/${currentshop.image}`)"
 alt="coffee shop img"/>
       -->
       <img :src="getImageURL(currentshop.image)"
 alt="coffee shop img"/>
    <div id="buttons">
      <button>Like</button>
      <button>Dislike</button>
      <button @click="addFavoriteShop()">Favorite</button>
      <button @click="unfavoriteShop()">Unfavorite</button>

      

    </div>
      
    </div>
    <div class="headers">Rating:</div>
    <div>
    <img id="rating" src="../assets/icons8-coffee-bean-48.png" alt=""  v-for="numberOfRating in currentshop.rating"
            v-bind:key="numberOfRating"/>
    </div>

    <div class="headers">Price:</div>
    <div>
    <img id="price" src="../assets/icons8-coffee-cup-64.png" alt=""  v-for="numberOfPrice in currentshop.price"
            v-bind:key="numberOfPrice"/>
    </div>


    <div><a href=''>{{ currentshop.menulink }}</a></div>
    <div> 
      <div class="headers">Hours:</div>
      <ul class="hours">
        <li>
        <p>Monday:</p> <p>{{ currentshop.monday }}</p>
        </li>
        <li> 
        <p>Tuesday:</p> <p>{{ currentshop.tuesday }}</p>
        </li>
        <li> 
        <p>Wednesday:</p> <p>{{ currentshop.wednesday }}</p>
        </li>
        <li> 
        <p>Thurday:</p> <p>{{ currentshop.thursday }}</p>
        </li>
        <li>
        <p>Friday: </p> <p>{{ currentshop.friday }}</p>
        </li>
        <li>
        <p>Saturday: </p> <p>{{ currentshop.saturday }}</p>
        </li>
        <li>
        <p>Sunday: </p> <p>{{ currentshop.sunday }}</p>
        </li>
      </ul>
      </div>
      <div class="headers">Address:</div>
    <div class="address"> {{ currentshop.address }}</div>
    
    
  

  </div>
</template>

<script>
import ShopService from '../services/ShopService';
export default {
  name: "shop-details",
  props: ['isSideBarOpen'],
  
  data() {
    return {
     
    }
  },
  computed: {
    currentshop(){
      return this.$store.state.activeShop;
    },
  },
  methods:{
    getImageURL(pic){
      return require('../assets/' + pic)
    },
    addFavoriteShop(){
      let shopId = this.currentshop.shopId;
      ShopService.addFavorite(shopId);
    },
    unfavoriteShop(){
      let shopId = this.currentshop.shopId;
      ShopService.unFavorite(shopId);
    }
   
  }
}
</script>

<style scoped>
img{
  max-width: 100%;
  height: auto;
  border-radius: 8px;
}


#shopdetails{
  display: grid;
  grid-template-columns: auto;
  align-items: center;
}
#shopdetails > div{
  margin-top: 10px;
  
}

.hours > li{
  display: flex;
  list-style-type: none;
  text-align: center;
  align-items: center;
  justify-content: space-between;
  width: 60%;
  margin-left: 20%;
  margin-right: 20%;
}
.address {
  display: flex;
  text-align: center;
  justify-content: center;
  margin-right: 20%;
  margin-left: 20%;
  width: 60%;
  cursor: default;
}
.headers {
  text-decoration: underline;
  cursor: default;
}
#buttons {
  display: flex;
  justify-content: space-between;
  /* margin-right: 5%;
  margin-left: 5%; */
  margin-top: 10px;
  font-size: 12px;

}

.button {
  box-shadow: 0 3px #666;
  color: #9f5a37
  
}
.button:active {
  box-shadow: 0 1px #666;
  background-color: #b48f58;
  transform: translateY(2px);
}


</style>