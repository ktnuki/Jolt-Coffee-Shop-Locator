import axios from 'axios';

export default {

    getShopsList() {
        return axios.get('/shops');
    },
    getShopById(id) {
        return axios.get(`/details${id}`)
    },
    addFavoriteShop(shopId) {
        return axios.post(`/favorites/${shopId}`)
    }
}