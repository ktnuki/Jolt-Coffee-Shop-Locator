import axios from 'axios';

export default {

    getShopsList() {
        return axios.get('/shops');
    },
    getShopById(id) {
        return axios.get(`/details${id}`)
    },
    getFavoritesList() {
        return axios.get('/favorites')
    },
    addFavorite(shopId) {
        return axios.post(`/favorites/${shopId}`, shopId)
    },
    unFavorite(shopId) {
        return axios.delete(`/favorites/${shopId}`)
    }
}