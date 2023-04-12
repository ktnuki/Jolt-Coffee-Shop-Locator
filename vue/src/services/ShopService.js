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
    }
}