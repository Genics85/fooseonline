import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_color.dart';
import 'package:provider/provider.dart';
import '../assets/app_text.dart';
import '../cart_model.dart';

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
          backgroundColor: AppColors.appBarColor,
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
        body: SafeArea(
          child: Consumer<CartModel>(
            builder:(context,cartModel,child){
              if (cartModel.cartItemsUrl.isEmpty){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage("images/emptyCart.png"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),

                      AppText(text: "Your cart is empty",size: 24,),

                      SizedBox(height: 20,),

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: AppText(text: "Continue Shopping...",color: Colors.green,size: 14,),
                      )
                    ],
                  ),
                ) ;
              }
              else{
                return Stack(
                  children: [
                    ListView.builder(
                      itemCount:cartModel.cartItemsUrl.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: Image(image:NetworkImage(cartModel.cartItemsUrl[index])),
                            title: AppText(text:"${cartModel.cartItemsName[index]}",color: Colors.black,),
                            subtitle: AppText(text:"GHc ${cartModel.cartItemPrice[index]}"),
                            trailing: IconButton(
                              icon: Icon(Icons.cancel,color: Colors.redAccent,),
                              onPressed: () {

                                cartModel.subtractTotalAmount(int.parse("${cartModel.cartItemPrice[index]}"));

                                cartModel.removeFromCartItems(
                                    "${cartModel.cartItemsName[index]}",
                                    "${cartModel.cartItemsUrl[index]}",
                                    "${cartModel.cartItemPrice[index]}"
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.maxFinite,50),
                            primary: AppColors.appBarColor,
                          ),
                          child: AppText(text: "CHECKOUT GHc ${cartModel.totalAmount} ",color: Colors.white,size: 18,)
                      ),
                    )
                  ],
                );
              }
            }
          )
        )
      ),
    );
  }
}
