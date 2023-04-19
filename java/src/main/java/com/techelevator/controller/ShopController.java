package com.techelevator.controller;

import com.techelevator.dao.JdbcShopDao;
import com.techelevator.dao.ShopDao;
import com.techelevator.model.CoffeeShop;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

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


    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addshops", method = RequestMethod.POST)
    public void addNewShop(@RequestBody CoffeeShop coffeeShop) {
        shopDao.addNewShop(coffeeShop);
    }

}
