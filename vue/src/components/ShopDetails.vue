<template>
  <div id="shopdetails" >
    <div id="sidebar-img">
      <img src="" alt="coffee shop img">
    </div>
    <div> {{ currentshop.rating }} </div>
    <div> {{ "price" }}  </div>
    <div>{{ "menu" }}</div>
    <div> 
      <h5>{{ "hours" }}</h5>
      <ul>
        <li>Mon</li>
        <li>Tue</li>
        <li>Wed</li>
        <li>Thur</li>
        <li>Fri</li>
        <li>Sat</li>
        <li>Sun</li>
      </ul>
      </div>
    <div>{{ currentshop.address }}</div>
    
    
  
  </div>
</template>

<script>
export default {
  name: "shop-details",
  data() {
    return {
    
    }
  },
  computed: {
    currentshop(){
      return this.$store.state.activeShop;
    }
  }
}
</script>

<style scoped>

#shopdetails{
  height: 100vh;
  display: grid;
  grid-template-columns: auto;
  align-items: center;
  border-color: blueviolet;
  border: solid;
  border-width: 1px;
}
#shopdetails > div{
  border-color: blueviolet;
  border: solid;
  border-width: 1px;
}

</style>