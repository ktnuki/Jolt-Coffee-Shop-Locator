package com.techelevator.dao;

import com.techelevator.model.CoffeeShop;

import java.util.List;

public interface ShopDao {
    List<CoffeeShop> getShopList();
    void addNewShop(CoffeeShop coffeeShop);


}

