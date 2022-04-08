import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{

  int _totalAmount=0;
  List cartItemsNames=[];
  List cartItemsUrls=[];
  List cartItemsPrices=[];
  bool _addedToCart=true;

  List get cartItemsName => cartItemsNames;
  List get cartItemsUrl => cartItemsUrls;
  List get cartItemPrice => cartItemsPrices;
  bool get addedToCart => _addedToCart;
  int get totalAmount =>_totalAmount;

  addToCartBool(){
    _addedToCart=!_addedToCart;
    notifyListeners();
  }

  int totalAmountCalculator(){
    for(var i=0;i==cartItemsUrls.length;i++){
      _totalAmount += int.parse(cartItemsPrices[i]);
    }
    return _totalAmount;
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

