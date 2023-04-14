package com.techelevator.dao;

import com.techelevator.model.CoffeeShop;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
public class JdbcShopDao implements ShopDao{
    private final JdbcTemplate jdbcTemplate;
    public JdbcShopDao(JdbcTemplate jdbcTemplate) {
      this.jdbcTemplate = jdbcTemplate;
  }


    @Override
    public List<CoffeeShop> getShopList() {
        List<CoffeeShop> shopsOutput = new ArrayList<>();
        String sql = "SELECT coffee_shops.shop_id, shop_name, main_image, website_link, price_range, rating, highlights, menu_link, address, sunday, monday, tuesday, wednesday, thursday, friday, saturday, latitude, longitude\n" +
                "FROM coffee_shops\n" +
                "JOIN shop_address ON shop_address.shop_id = coffee_shops.shop_id\n" +
                "JOIN address ON shop_address.address_id = address.address_id\n" +
                "JOIN hours ON hours.shop_id = coffee_shops.shop_id\n"+
                "ORDER BY shop_name";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()){
            CoffeeShop shop = new CoffeeShop();
            shop.setShopId(results.getInt("shop_id"));
            shop.setShop(results.getString("shop_name"));
            shop.setImage(results.getString("main_image"));
            shop.setWebLink(results.getString("website_link"));
            shop.setPrice(results.getInt("price_range"));
            shop.setRating(results.getInt("rating"));
            shop.setHighlights(results.getString("highlights"));
            shop.setMenuLink(results.getString("menu_link"));
            shop.setAddress(results.getString("address"));
            shop.setSunday(results.getString("sunday"));
            shop.setMonday(results.getString("monday"));
            shop.setTuesday(results.getString("tuesday"));
            shop.setWednesday(results.getString("wednesday"));
            shop.setThursday(results.getString("thursday"));
            shop.setFriday(results.getString("friday"));
            shop.setSaturday(results.getString("saturday"));
            shop.setLatitude(results.getFloat("latitude"));
            shop.setLongitude(results.getFloat("longitude"));
            shopsOutput.add(shop);
        }
        return shopsOutput;
    }
}
