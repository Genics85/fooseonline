import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{

  List cartItemsNames=[];
  List cartItemsUrls=[];
  List cartItemsPrices=[];
  bool _addedToCart=true;
  List itemsAddedIndexes=[];

  List get cartItemsName => cartItemsNames;
  List get cartItemsUrl => cartItemsUrls;
  List get cartItemPrice => cartItemsPrices;
  List get addedIndex=>itemsAddedIndexes;
  bool get addedToCart => _addedToCart;

  addToCartBool(){
    _addedToCart=!_addedToCart;
    notifyListeners();
  }

  addToCartItems(String itemName,String itemUrl, String itemPrice,int index){
    cartItemsNames.add(itemName);
    cartItemsUrls.add(itemUrl);
    cartItemsPrices.add(itemPrice);
    itemsAddedIndexes.add(index);
    notifyListeners();
  }

  removeFromCartItems(String itemName,String itemUrl, String itemPrice, int index){
    cartItemsNames.remove(itemName);
    cartItemsUrls.remove(itemUrl);
    cartItemsPrices.remove(itemPrice);
    itemsAddedIndexes.remove(index);
    notifyListeners();
  }
}