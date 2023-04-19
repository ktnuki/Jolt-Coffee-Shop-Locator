<template>
  <div>
    <form v-on:submit.prevent="addNewShop" class="coffeeShopForm">
      <label for="coffeeShopName">Coffee Shop Name: </label>
      <input type="text" v-model="newShop.shop" id="coffeeShopName" name="coffeeShopName" required><br>

      <label for="coffeeShopImage"> Coffee Shop Image: </label>
      <input type="text" v-model="newShop.image" id="coffeeShopImage" name="coffeeShopImage" required><br>
      <p class="instructions">Please provide an image that you would like associated with your shop.</p>

      <label for="coffeeShopWebLink"> Coffee Shop Website Link: </label>
      <input type="text" v-model="newShop.webLink" id="coffeeShopWebLink" name="coffeeShopWebLink" required><br>

      <label for="coffeeShopAddress"> Address: </label>
      <input type="text" v-model="newShop.address" id="coffeeShopAddress" name="coffeeShopAddress" required><br>

      <p class="instructions">You can enter your latitude and longitude below to have your shop show up on our map. <br>
                              You can use the following site to convert your address: <a href="https://www.latlong.net/convert-address-to-lat-long.html" target="_blank">latlong.net</a>
      </p>
      <label for="latitude"> Latitude: </label>
      <input type="text" v-model.number="newShop.latitude" id="latitude" name="latitude" required><br>

      <label for="longitude"> Longitude: </label>
      <input type="text"  v-model.number="newShop.longitude" id="longitude" name="longitude" required><br>

      <p>Enter Shop Hours:<p>
      <p class="instructions">Please enter your shop hours for each day of the week formatted as 9a-9p. If closed, please type "closed".</p>
      <label for="coffeeShopMonday">Monday: </label>
      <input type="text" v-model="newShop.monday" id="coffeeShopHours" name="coffeeShopMonday" required><br>

      <label for="coffeeShopTuesday">Tuesday: </label>
      <input type="text" v-model="newShop.tuesday" id="coffeeShopHours" name="coffeeShopTuesday" required><br>

      <label for="coffeeShopWednesday">Wednesday: </label>
      <input type="text" v-model="newShop.wednesday" id="coffeeShopHours" name="coffeeShopWednesday" required><br>

      <label for="coffeeShopThursday">Thursday: </label>
      <input type="text" v-model="newShop.thursday" id="coffeeShopHours" name="coffeeShopThursday" required><br>

      <label for="coffeeShopFriday">Friday: </label>
      <input type="text" v-model="newShop.friday" id="coffeeShopHours" name="coffeeShopFriday" required><br>

      <label for="coffeeShopSaturday">Saturday: </label>
      <input type="text" v-model="newShop.saturday" id="coffeeShopHours" name="coffeeShopSaturday" required><br>

      <label for="coffeeShopSunday">Sunday: </label>
      <input type="text" v-model="newShop.sunday" id="coffeeShopHours" name="coffeeShopSunday" required><br>

      <label for="coffeeShopPrice"> Coffee Shop Price Range: </label>
      <input type="text" v-model.number="newShop.price" id="coffeeShopPrice" name="coffeeShopPrice" required><br>
      <p class="instructions">Please provide a price range for your shop from 1 - 5. 1 is the lowest, 5 is the highest.</p>

      <label for="coffeeShopRating"> Coffee Shop Rating: </label>
      <input type="text" v-model.number="newShop.rating" id="coffeeShopRating" name="coffeeShopRating" required><br>
      <p class="instructions">Please provide your shop's rating based on Google Reviews to the nearest whole number.</p>

      <label for="coffeeShopHighlights" class="coffeeShopHighlights"> Coffee Shop Highlights: </label>
<div class="highlightBox">
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="food" id="food" value="food" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Food</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="desserts" id="desserts" value="dessert" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Desserts</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="smoothies" id="smoothies" value="smoothies" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Smoothies</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="grounds" id="grounds" value="bean" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Beans and/or grounds</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="alcohol" id="alcohol" value="alcohol" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Alcohol</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="non-dairy" id="non-dairy" value="non-dairy" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Non-dairy alternatives</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="outdoor seating" id="outdoor seating" value="outdoor seating" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Outdoor seating</p>
      <p class="checkboxLabel"><input type="checkbox" v-model="newHighlights" name="dog friendly" id="dog friendly" value="dog friendly" class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;Pet friendly<br></p>
</div>
      <input type="submit">


    </form>
  </div>
</template>

<script>
import ShopService from '../services/ShopService'
export default {
    name: "add-shops",

    data(){
      return {
        newHighlights: [],
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

        let output = "";
        for (let i = 0; i < this.newHighlights.length; i++) {
          if (this.newHighlights[i] != "") {
            output += this.newHighlights[i] + " ";
          } 
        }

        this.newShop.highlights = output;
      console.log(this.newShop.highlights);
      console.log("output=" + output);


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
  font-size: 14px;
}

.coffeeShopForm {
  text-align: center;
  align-items: center;
  justify-content: space-between;
  width: 76%;
  margin-left: 12%;
  margin-right: 12%;
}

.highlightBox {
  text-align: left;
  width: 35%;
  margin-left: 35%;
  margin-right: 30%;
}

 .checkbox .checkboxLabel {
   width: 10%;
  display: flex;
  flex-direction: row;
  margin-left: 45%;
  margin-right: 45%;
}

.checkbox {
  justify-items: left;
  align-items: flex-start;
  text-align: left;
}

.coffeeShopHighlights > p {
 width: 20%;
  justify-content: left;
  align-items: flex-start;
  text-align: left;
}


</style>