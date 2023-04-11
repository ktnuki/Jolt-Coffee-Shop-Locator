<template>
  <div id="shopdetails" >
    <div id="sidebar-img">
      <img v-bind:src='imagePath' alt="coffee shop img">
      
    </div>
    <div> {{ currentshop.rating }} </div>
    <div> {{ currentshop.price}}  </div>
    <div><a href=''>{{ currentshop.menulink }}</a></div>
    <div> 
      <h5>{{ "hours" }}</h5>
      <ul>
        <li>Mon {{ currentshop.monday }}</li>
        <li>Tue {{ currentshop.tuesday }}</li>
        <li>Wed {{ currentshop.wednesday }}</li>
        <li>Thur {{ currentshop.thursday }}</li>
        <li>Fri {{ currentshop.friday }}</li>
        <li>Sat {{ currentshop.saturday }}</li>
        <li>Sun {{ currentshop.sunday }}</li>
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
    },

   
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