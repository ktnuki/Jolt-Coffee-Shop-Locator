package com.techelevator.controller;

import com.techelevator.dao.JdbcShopDao;
import com.techelevator.dao.ShopDao;
import com.techelevator.model.CoffeeShop;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

//TODO: add preauth

@CrossOrigin
@RestController
public class ShopController {
    private ShopDao shopDao;

    public ShopController(ShopDao shopDao){
        this.shopDao = shopDao;
    }

    @RequestMapping(path = "/shops", method = RequestMethod.GET)
    public List<CoffeeShop> getAllShops(){
        return shopDao.getShopList();
    }


}
