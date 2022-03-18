import 'package:flutter/material.dart';

import '../assets/app_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle:true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(text:"Shopping Cart",color: Colors.white,size: 20,),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.shopping_cart_outlined)
            ],
          ),
        ),
        body: Center(
          child: AppText(text:"Empyt cart"),
        ),
      ),
    );
  }
}
