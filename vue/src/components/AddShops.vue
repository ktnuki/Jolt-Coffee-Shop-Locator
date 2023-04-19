<template>
  <div>
    <form v-on:submit.prevent="addNewShop">
      <label for="coffeeShopName">Coffee Shop Name: </label>
      <input type="text" v-model="newShop.shop" id="coffeeShopName" name="coffeeShopName" required><br>

      <label for="coffeeShopImage"> Coffee Shop Image: </label>
      <input type="text" v-model="newShop.image" id="coffeeShopImage" name="coffeeShopImage" required><br>
      <p class="instructions">Please provide an image that you would like associated with your shop.</p>

      <label for="coffeeShopWebLink"> Coffee Shop Website Link: </label>
      <input type="text" v-model="newShop.webLink" id="coffeeShopWebLink" name="coffeeShopWebLink" required><br>

      <label for="coffeeShopMenuLink"> Coffee Shop Menu Link: </label>
      <input type="text" v-model="newShop.menuLink" id="coffeeShopMenuLink" name="coffeeShopMenuLink" required><br>

      <label for="coffeeShopAddress"> Address: </label>
      <input type="text" v-model="newShop.address" id="coffeeShopAddress" name="coffeeShopAddress" required><br>

      <label for="latitude"> Latitude: </label>
      <input type="text" v-model.number="newShop.latitude" id="latitude" name="latitude" required><br>

      <label for="longitude"> Longitude: </label>
      <input type="text"  v-model.number="newShop.longitude" id="longitude" name="longitude" required><br>

      <label for="coffeeShopMonday"> Enter Shop Hours for Monday: </label>
      <input type="text" v-model="newShop.monday" id="coffeeShopMonday" name="coffeeShopMonday" required><br>

      <label for="coffeeShopTuesday"> Enter Shop Hours for Tuesday: </label>
      <input type="text" v-model="newShop.tuesday" id="coffeeShopTuesday" name="coffeeShopTuesday" required><br>

      <label for="coffeeShopWednesday"> Enter Shop Hours for Wednesday: </label>
      <input type="text" v-model="newShop.wednesday" id="coffeeShopWednesday" name="coffeeShopWednesday" required><br>

      <label for="coffeeShopThursday"> Enter Shop Hours for Thursday: </label>
      <input type="text" v-model="newShop.thursday" id="coffeeShopThursday" name="coffeeShopThursday" required><br>

      <label for="coffeeShopFriday"> Enter Shop Hours for Friday: </label>
      <input type="text" v-model="newShop.friday" id="coffeeShopFriday" name="coffeeShopFriday" required><br>

      <label for="coffeeShopSaturday"> Enter Shop Hours for Saturday: </label>
      <input type="text" v-model="newShop.saturday" id="coffeeShopSaturday" name="coffeeShopSaturday" required><br>

      <label for="coffeeShopSunday"> Enter Shop Hours for Sunday: </label>
      <input type="text" v-model="newShop.sunday" id="coffeeShopSunday" name="coffeeShopSunday" required><br>

      <label for="coffeeShopPrice"> Coffee Shop Price Range: </label>
      <input type="text" v-model.number="newShop.price" id="coffeeShopPrice" name="coffeeShopPrice" required><br>
      <p class="instructions">Please provide a price range for your shop from 1 - 5. 1 is the lowest, 5 is the highest.</p>

      <label for="coffeeShopRating"> Coffee Shop Rating: </label>
      <input type="text" v-model.number="newShop.rating" id="coffeeShopRating" name="coffeeShopRating" required><br>
      <p class="instructions">Please provide your shop's rating based on Google Reviews to the nearest whole number.</p>

      <label for="coffeeShopHighlights"> Coffee Shop Highlights: </label>
      <input type="checkbox" v-model="newShop.highlights" name="food" id="food">Food
      <input type="checkbox" v-model="newShop.highlights" name="desserts" id="desserts">Desserts
      <input type="checkbox" v-model="newShop.highlights" name="smoothies" id="smoothies">Smoothies
      <input type="checkbox" v-model="newShop.highlights" name="grounds" id="grounds">Beans and/or grounds
      <input type="checkbox" v-model="newShop.highlights" name="alcohol" id="alcohol">Alcohol
      <input type="checkbox" v-model="newShop.highlights" name="non-dairy" id="non-dairy">Non-dairy alternatives
      <input type="checkbox" v-model="newShop.highlights" name="outdoor seating" id="outdoor seating">Outdoor seating
      <input type="checkbox" v-model="newShop.highlights" name="dog friendly" id="pet friendly">Pet friendly<br>


      <input type="submit">


      <!-- 
        ? The address will have to go through Google Geocoder API to be converted into lat & long 
        Submit needs to put this in an "pending" database table
        Admin needs a page only they can view to be able to approve/deny shop requests 
        Approved shops need to go to the database, denied shops should be deleted from the database
      -->


    </form>
  </div>
</template>

<script>
import ShopService from '../services/ShopService'
export default {
    name: "add-shops",

    data(){
      return {
        newShop: {
          shop: "",
          image: "",
          webLink: "",
          price: 0,
          rating: 0,
          highlights: "",
          menuLink: "",
          monday: "",
          tuesday: "",
          wednesday: "",
          thursday: "",
          friday: "",
          saturday: "",
          sunday: "",
          latitude: 0,
          longitude: 0,
          address: ""
        }
      }
    },
    methods: {
      addNewShop(){
        ShopService.addNewShop(this.newShop).then((response) => {
          if(response.status == 201) {
            this.$router.push('/shops');
          }
        })
        .catch(err => console.error(err));
      }
    }
}
</script>

<style>
.instructions {
  font-size: 10px;
}

</style>