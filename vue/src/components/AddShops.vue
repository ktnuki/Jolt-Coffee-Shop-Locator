<template>
  <div>
    <form action="">
      <label for="coffeeShopName">Coffee Shop Name: </label>
      <input type="text" id="coffeeShopName" name="coffeeShopName"><br>

      <label for="coffeeShopImage"> Coffee Shop Image: </label>
      <input type="text" id="coffeeShopImage" name="coffeeShopImage"><br>
      <p class="instructions">Please provide an image that you would like associated with your shop.</p>

      <label for="coffeeShopWebLink"> Coffee Shop Website Link: </label>
      <input type="text" id="coffeeShopWebLink" name="coffeeShopWebLink"><br>

      <label for="coffeeShopMenuLink"> Coffee Shop Menu Link: </label>
      <input type="text" id="coffeeShopMenuLink" name="coffeeShopMenuLink"><br>

      <label for="coffeeShopAddress"> Coffee Shop Address: </label>
      <input type="text" id="coffeeShopAddress" name="coffeeShopAddress"><br>

      <label for="coffeeShopPrice"> Coffee Shop Price Range: </label>
      <input type="text" id="coffeeShopPrice" name="coffeeShopPrice"><br>
      <p class="instructions">Please provide a price range for your shop from 1 - 5. 1 is the lowest, 5 is the highest.</p>

      <label for="coffeeShopRating"> Coffee Shop Rating: </label>
      <input type="text" id="coffeeShopRating" name="coffeeShopRating"><br>
      <p class="instructions">Please provide your shop's rating based on Google Reviews to the nearest whole number.</p>

      <label for="coffeeShopHighlights"> Coffee Shop Highlights: </label>
      <input type="checkbox" name="food" id="food">Food
      <input type="checkbox" name="desserts" id="desserts">Desserts
      <input type="checkbox" name="smoothies" id="smoothies">Smoothies
      <input type="checkbox" name="grounds" id="grounds">Beans and/or grounds
      <input type="checkbox" name="alcohol" id="alcohol">Alcohol
      <input type="checkbox" name="non-dairy" id="non-dairy">Non-dairy alternatives
      <input type="checkbox" name="outdoor-seating" id="outdoor-seating">Outdoor seating
      <input type="checkbox" name="pet-friendly" id="pet-friendly">Pet friendly<br>


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
export default {
    name: "add-shops"
}
</script>

<style>
.instructions {
  font-size: 10px;
}

</style>