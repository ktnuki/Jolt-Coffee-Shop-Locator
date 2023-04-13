<template>
    <div>
      <h1>Your Coordinates:</h1>
      <p>{{ coordinates.lat }} Latitude, {{ coordinates.lng }} Longitude</p>
      <GmapMap
        :center="{lat: coordinates.lat, lng: coordinates.lng}"  
        :zoom="9"
        style="width: 100%; height:360px;"
      >
      <gmap-marker
          class="marker"
          :position="{lat: coordinates.lat, lng: coordinates.lng}"
          :icon="'http://maps.google.com/mapfiles/kml/pal3/icon56.png'"
          :clickable="true"
          :draggable="false"
      ></gmap-marker>
      <gmap-marker 
          v-for="shop in $store.state.shops" :key="shop.shopId"
          :position="{lat: parseFloat(shop.latitude), lng: parseFloat(shop.longitude)}"
          :icon="'//maps.google.com/mapfiles/kml/pal2/icon54.png'"
          :clickable="true"
          :draggable="false"
      ></gmap-marker>
    </GmapMap>
    </div>
  </template>

  <script>
  export default {
      name: 'Map',
      data(){
          return {
              coordinates: {
                  lat: 0,
                  lng: 0
              },
          }
      },
    method: {
    },
      created(){
        this.$getLocation({})
       
        .then((coordinates) => {
            this.coordinates = coordinates;
        })
        .catch(error => alert(error));
      }
  }
  </script>
  
  <style>
   .marker{
      width: 5px;
      height: auto;
   }
  </style>