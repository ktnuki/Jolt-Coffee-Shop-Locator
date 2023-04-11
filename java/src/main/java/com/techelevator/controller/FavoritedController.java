package com.techelevator.controller;

import com.techelevator.dao.FavoritedShopDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.FavoritedShop;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.List;

//TODO: add preauth

@CrossOrigin
@RestController
public class FavoritedController {

    private FavoritedShopDao favoritedShopDao;
    private UserDao userDao;

    public FavoritedController(FavoritedShopDao favoritedShopDao, UserDao userDao) {
        this.favoritedShopDao = favoritedShopDao;
        this.userDao = userDao;
    }

    @RequestMapping(path="/favorites/{id}", method= RequestMethod.GET)
    public List<FavoritedShop> getAllFavoritedShops(@PathVariable("id") int userId) {
        List<FavoritedShop> favorites = favoritedShopDao.getFavoriteShopsList(userId);
        if (favorites == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not found.");
        } else {
            return favorites;
        }
    }

    @RequestMapping(path="/favorites", method = RequestMethod.POST)
    public FavoritedShop addShopToFavorites(@RequestBody FavoritedShop favoritedShop) {
         return favoritedShopDao.addFavorite(favoritedShop);
    }

    @RequestMapping(path="/favorites/{id}-{id}", method = RequestMethod.DELETE)
    public void deleteFavoriteShop(@PathVariable("id") int shopId, @PathVariable("id") int userId) {
        favoritedShopDao.deleteShop(shopId, userId);
    }

}
