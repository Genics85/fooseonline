import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{

  List cartItemsNames=[];
  List cartItemsUrls=[];
  List cartItemsPrices=[];
  bool _addedToCart=true;


  List get cartItemsName => cartItemsNames;
  List get cartItemsUrl => cartItemsUrls;
  List get cartItemPrice => cartItemsPrices;
  bool get addedToCart => _addedToCart;

  addToCartBool(){
    _addedToCart=!_addedToCart;
    notifyListeners();
  }

  addToCartItems(String itemName,String itemUrl, String itemPrice){
    cartItemsNames.add(itemName);
    cartItemsUrls.add(itemUrl);
    cartItemsPrices.add(itemPrice);
    notifyListeners();
  }

  removeFromCartItems(String itemName,String itemUrl, String itemPrice){
    cartItemsNames.remove(itemName);
    cartItemsUrls.remove(itemUrl);
    cartItemsPrices.remove(itemPrice);
    notifyListeners();
  }
}
