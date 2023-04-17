<template>
  <div>
    <GmapMap
      ref="map"
      :center="{ lat: $store.state.coordinates.lat, lng: $store.state.coordinates.lng }"
      :zoom="12"
      style="width: 100%; height: 450px"
    >
      <gmap-marker
        class="marker"
        :position="{ lat: $store.state.coordinates.lat, lng: $store.state.coordinates.lng }"
        :icon="'http://maps.google.com/mapfiles/kml/pal3/icon56.png'"
        :clickable="true"
        :draggable="false"
      ></gmap-marker>
      <gmap-marker
        v-for="shop in $store.state.shops"
        :key="shop.shopId"
        :position="{
          lat: parseFloat(shop.latitude),
          lng: parseFloat(shop.longitude),
        }"
        :icon="'//maps.google.com/mapfiles/kml/pal2/icon54.png'"
        :clickable="true"
        :draggable="false"
        v-on:click="setActiveShop(shop), $emit('opensidebar')/* , openWindow(shop) */"
      >
       <!--  <gmap-info-window
          :key="shop.shopId"
          :options="infoWindowOptions"
          :position="infoWindowPosition"
          :opened="toggleInfoWindow"
        >
          <div class="info-wind">
            <h2>{{ $store.state.activeShop.shop }}</h2>
            <p>{{ $store.state.activeShop.address }}</p>
          </div>
        </gmap-info-window> -->
      </gmap-marker>
    </GmapMap>
    <button @click="loadDirection()" id="get-directions">Get Directions</button>
  </div>
</template>

  <script>
export default {
  name: "Map",
  directionsService: null,
  directionsDisplay: null,
  data() {
    return {
      
/*       coordinates: {
        lat: 0,
        lng: 0,
      }, */
      infoWindowOptions: {
        pixelOffset: {
          width: 0,
          height: 0,
        }
      },
      toggleInfoWindow: false,
    };
  },
  methods: {
    setActiveShop(shop) {
      return this.$store.commit("SET_ACTIVE_SHOP", shop);
    },
    loadDirection() {
      if(this.directionsRenderer){
        this.directionsRenderer.setMap(null)
      }
      const directionsService = new window.google.maps.DirectionsService();
      this.directionsRenderer = new window.google.maps.DirectionsRenderer();
      this.directionsRenderer.setMap(this.$refs.map.$mapObject);
      this.calculateAndDisplayRoute(directionsService, this.directionsRenderer);
    },

    calculateAndDisplayRoute(directionsService, directionsRenderer) {
      const origin = { lat: this.$store.state.coordinates.lat, lng: this.$store.state.coordinates.lng };
      const destination = this.$store.state.activeShop.address;
      console.log(origin, destination);
      directionsService
        .route({
          origin: origin,
          destination: destination,
          travelMode: window.google.maps.TravelMode.DRIVING,
        })
        .then((response) => {
          directionsRenderer.setDirections(response);
        })
        .catch((error) => alert(error));
    },
  },
   /*  openWindow(shop){
      this.toggleInfoWindow = this.toggleInfoWindow === shop.shopId ? null : shop.shopId;
    } */
  computed: {
    infoWindowPostions() {
      return {
        lat: parseFloat(this.$store.state.activeShop.latitude),
        lng: parseFloat(this.$store.state.activeShop.longitude),
      };
    },
  },
  created() {
    this.$getLocation({})

      .then((coordinates) => {
        this.$store.commit("SET_COORDINATES", coordinates)
      })
      .catch((error) => alert(error));
  },
};
</script>
  
  <style>
.marker {
  width: 5px;
  height: auto;
}
</style>