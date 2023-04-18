<template>
  <div class="button-component">
    <button @click="$store.commit('SET_DIRECTIONS')" id="get-directions">Get Directions</button>
    <button @click="$store.commit('CLEAR_DIRECTIONS')" id="clear-directions">Clear Directions</button>
    <select name="filterDropdown" @change="onChange($event)" id="form-select" class="form-select form-control">
        <option value="">--Filter Shops By Selection--</option>
        <option value="filter-by-favorites">Filter By Favorites</option> 
        <option value="filter-by-rating">Filter By Rating</option> 
        <option value="filter-by-distance">Filter By Distance</option>
        <option value="filter-by-visited">Filter By Visited</option> 
      </select>
  </div>
</template>

<script>
export default {
methods: {
    onChange(e){
      let selected = e.target.value
      console.log(selected)
      this.$store.commit("SET_DROPDOWN_SELECTION", selected)
    },
}
}
</script>

<style>
#form-select{
  width: min-content;
  height: max-content;
  font: inherit;
  color: #683012;
  background-color: #ddaf6b;
  border: 0.2rem #9f5a37 solid;
  border-radius: 5px;
  box-shadow: 0 1.5px #999;
  padding: 5px 15px 5px 15px;
  line-height: normal;
}
.button-component {
  display: flex;
  justify-content:center;
  column-gap: 2em;
  margin-top: 20px;
  padding-bottom: 0px;
}
</style>