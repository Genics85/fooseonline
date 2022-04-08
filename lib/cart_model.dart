import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{

  List cartItemsNames=[];
  List cartItemsUrls=[];
  List cartItemsPrices=[];
  bool _addedToCart=true;
  int _totalAmount=0;


  List get cartItemsName => cartItemsNames;
  List get cartItemsUrl => cartItemsUrls;
  List get cartItemPrice => cartItemsPrices;
  bool get addedToCart => _addedToCart;
  int get totalAmount=> _totalAmount;

  void addTotalAmount(int tAmount){
    this._totalAmount = this._totalAmount + tAmount;
    notifyListeners();
  }
  void subtractTotalAmount(int tAmount){
    this._totalAmount = this._totalAmount - tAmount;
    notifyListeners();
  }

  addToCartBool(){
    _addedToCart=!_addedToCart;
    notifyListeners();
  }

  addToCartItems(String itemName,String itemUrl, String itemPrice){
    cartItemsNames.add(itemName);
    cartItemsUrls.add(itemUrl);
    cartItemsPrices.add(itemPrice);
    debugPrint(cartItemsPrices.toString());
    debugPrint(cartItemsPrices.length.toString());
    debugPrint(cartItemsUrls.length.toString());
    debugPrint(cartItemsNames.length.toString());
    notifyListeners();
  }

  removeFromCartItems(String itemName,String itemUrl, String itemPrice){
    cartItemsNames.remove(itemName);
    cartItemsUrls.remove(itemUrl);
    cartItemsPrices.remove(itemPrice);
    debugPrint(cartItemsPrices.length.toString());
    debugPrint(cartItemsUrls.length.toString());
    debugPrint(cartItemsNames.length.toString());
    notifyListeners();
  }


}

