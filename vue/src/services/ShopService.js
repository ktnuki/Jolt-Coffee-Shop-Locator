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
<<<<<<< HEAD
=======
    },
    addFavorite(shopId){
        return axios.post(`/favorites/${shopId}`, shopId)
    },
    unFavorite(shopId){
        return axios.delete(`/favorites/${shopId}`, shopId)
>>>>>>> bc6367ac5f0e4c9c5f7d1deed8920b8c46ee9a38
    }
} 