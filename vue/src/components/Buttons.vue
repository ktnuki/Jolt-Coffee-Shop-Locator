<template>
  <div>
    <button @click="$store.commit('SET_DIRECTIONS')" id="get-directions">Get Directions</button>
    <button @click="$store.commit('CLEAR_DIRECTIONS')" id="clear-directions">Clear Directions</button>
    <select name="filterDropdown" @change="onChange($event)" id="form-select" class="form-select form-control">
        <option value="">--------Select Option--------</option>
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
  font-size: 16px;
  color: #9f5a37;
  background-color: #ddaf6b;
  border: #683012 solid;
  border-width: 2px;
  border-radius: 8px;
  box-shadow: 0 2px #666;
  padding: 5px 15px 5px 15px;
}
</style>