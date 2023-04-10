import axios from 'axios';

export default {

    getShopsList() {
        return axios.get('/shops');
    }
}