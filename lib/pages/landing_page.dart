import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_button.dart';
import 'package:fooseonline/assets/app_color.dart';
import 'package:fooseonline/assets/app_text.dart';
import 'package:fooseonline/assets/buy_more_button.dart';
import 'package:fooseonline/assets/buy_now_button.dart';
import 'package:fooseonline/assets/contact_dialog.dart';
import 'package:fooseonline/assets/search_space.dart';
import 'package:fooseonline/pages/cart_page.dart';
import 'package:fooseonline/payment/paystack_payment.dart';


class LandingPage extends StatefulWidget {

   LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  String email="eugeneamo85@gmail.com";

  TextEditingController searchController=TextEditingController();

  Icon searchButtonIcon1=Icon(Icons.search,color: Colors.black45,);
  Icon searchButtonIcon2=Icon(Icons.cancel_outlined,color: Colors.black45,);

  int selectedButton=0;
  int unisexIndex=0;
  int maleIndex=1;
  int femaleIndex=2;
  int kidsIndex=3;


  List <String> img=[
    "images/unisex.jpg",
    "images/shirt2.jpg",
    "images/females.jpg",
    "images/kids.jpg",
  ];

  _onSearchChange(){
    if(searchController.text != ""){
      setState(() {
        selectedButton=4;
      });
    }else{
      setState(() {
        selectedButton=unisexIndex;
      });
    }
  }

  searchControllerClear(){
    setState(() {
      searchController.text="";
    });
  }

  @override
  void initState() {
    searchController.addListener(_onSearchChange);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
    searchController.removeListener(_onSearchChange);
  }

  @override
  Widget build(BuildContext context) {

    List  firebaseSnapshots=[
      FirebaseFirestore.instance.collection("posts").where("sex", whereIn: ["Male","Female"]).snapshots(),
      FirebaseFirestore.instance.collection("posts").where("sex",isEqualTo: "Male").snapshots(),
      FirebaseFirestore.instance.collection("posts").where("sex", isEqualTo:"Female").snapshots(),
      FirebaseFirestore.instance.collection("posts").where("sex", isEqualTo: "Kids").snapshots(),
      FirebaseFirestore.instance.collection("posts").where("name", isEqualTo:searchController.text).snapshots()
    ];

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<Object>(
          stream: firebaseSnapshots[selectedButton],
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:const BoxDecoration(
                color:Colors.white
              ),
              child: Stack(
                children:[
                  ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context , index){
                        return Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 500,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 4,
                                          offset: const Offset(0,2)
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 385,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: const Radius.circular(20), topRight: const Radius.circular(20)),
                                          color: Colors.grey,
                                          image: DecorationImage(image: NetworkImage("${snapshot.data.docs[index]["imageUrl"]}"),
                                          fit: BoxFit.cover
                                          )
                                      ),
                                    ),

                                    const SizedBox(height: 10,),

                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              AppText(text:"Size:${snapshot.data.docs[index]["size"]}",size: 18,),
                                              AppText(text: "GHc:${snapshot.data.docs[index]["price"]} ",color: Colors.red,)
                                            ],
                                          ),
                                          const SizedBox(height: 20,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                  onTap:(){
                                                    debugPrint("buy tapper");
                                                    MakePayment(ctx: context,email: email,price: 40).chargeCardAndMakePayment();
                                                  },
                                                  child: BuyNowButton()),
                                              BuyMoreButton()
                                            ],
                                          )
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  Container(
                    padding: EdgeInsets.only(top: 20,left: 10),
                    alignment: Alignment.topLeft,

                      child: Search(
                        controller: searchController,
                        searchButtonIcon:searchController.text != "" ?searchButtonIcon2:searchButtonIcon1,
                        searchIconButtonFunc: searchController.text!=""?searchControllerClear:null,
                      )
                  ),
                  Positioned(
                    right: 5,
                    top: 10,
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartPage()
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,size: 40,)
                      ),
                        Positioned(
                          top: 5,
                          right: 1,
                          child: Container(
                            alignment: Alignment.center,
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red
                            ),
                            child: AppText(text: "22",color: Colors.white,size: 10,),
                          ),
                        )
                      ],
                    ),
                  ),

                  Positioned(
                    top: MediaQuery.of(context).size.height-350,
                    left: MediaQuery.of(context).size.width-55,
                    child: Container(
                      padding: EdgeInsets.only( right: 5),
                      child: Column(
                        children: [
                          //Unisex button
                          GestureDetector(
                            onTap:(){
                              setState(() {
                                selectedButton=unisexIndex;
                              });
                            },
                            child:Buttons(
                              img:"gender.png",
                              color: selectedButton==unisexIndex?AppColors.activeButton:AppColors.inActiveButton),
                          ),
                          //males button
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedButton=maleIndex;
                                });
                              },
                              child: Buttons(
                                  img:"male logo.png",
                              color: selectedButton==maleIndex?AppColors.activeButton:AppColors.inActiveButton,)
                          ),
                          //females button
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedButton=femaleIndex;
                                });
                              },
                              child: Buttons(
                                img:"female logo.png",
                                color: selectedButton==femaleIndex?AppColors.activeButton:AppColors.inActiveButton,)
                          ),
                          //kids button
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  selectedButton=kidsIndex;
                                });
                              },
                              child: Buttons(
                                img:"kids logo.png",
                                color: selectedButton==kidsIndex?AppColors.activeButton:AppColors.inActiveButton,)
                          ),
                          const SizedBox(height: 20),
                          //Contact button
                          GestureDetector(
                              onTap: (){
                                return ContactDialog().createContactDialog(context);
                              },
                              child: Buttons(img:"phone.png",))
                        ],
                      )
                    ),
                  )
                ]
              )
            );
          }
        ),
      )
    );
  }
}