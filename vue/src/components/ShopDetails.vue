<template>
  <div id="shopdetails" >
    <div id="sidebar-img">
      <!-- <img :src="require(`../assets/${currentshop.image}`)"
 alt="coffee shop img"/>
       -->
       <img :src="getImageURL(currentshop.image)"
 alt="coffee shop img"/>
      
    </div>
    <div>Rating: {{ currentshop.rating }} </div>
    <img id="price" src="../assets/icons8-coffee-bean-48.png" alt=""  v-for="numberOfRating in currentshop.rating"
            v-bind:key="numberOfRating"/>
    <div>Price: {{ currentshop.price}}  </div>
    <img id="price" src="../assets/icons8-coffee-cup-64.png" alt=""  v-for="numberOfPrice in currentshop.price"
            v-bind:key="numberOfPrice"/>

    <div><a href=''>{{ currentshop.menulink }}</a></div>
    <div> 
      <h5>{{ "hours" }}</h5>
      <ul class="hours">
        <li>Monday: {{ currentshop.monday }}</li>
        <li>Tuesday: {{ currentshop.tuesday }}</li>
        <li>Wednesday: {{ currentshop.wednesday }}</li>
        <li>Thurday: {{ currentshop.thursday }}</li>
        <li>Friday: {{ currentshop.friday }}</li>
        <li>Saturday: {{ currentshop.saturday }}</li>
        <li>Sunday: {{ currentshop.sunday }}</li>
      </ul>
      </div>
    <div>Address: {{ currentshop.address }}</div>
    
    
  
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
  },
  methods:{
    getImageURL(pic){
      return require('../assets/' + pic)
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
/*   border-color: blueviolet;
  border: solid;
  border-width: 1px; */
}
#shopdetails > div{
  margin-top: 10px;
  /* border-color: blueviolet;
  border: solid;
  border-width: 1px; */
}

.hours{
  list-style-type: none;
}

</style>