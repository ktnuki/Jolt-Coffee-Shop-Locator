<template>
    <div>
      <h1>Your Coordinates:</h1>
      <p>{{ coordinates.lat }} Latitude, {{ coordinates.lng }} Longitude</p>
      <GmapMap
        :center="{lat: coordinates.lat, lng: coordinates.lng}"  
        :zoom="9"
        style="width: 100%; height:360px;"
      ></GmapMap>
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
              }

          }
      },
      computed: {
        mapCenter(){
            return {
            }
        }
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
  
  </style>