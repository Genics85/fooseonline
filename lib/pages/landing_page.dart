import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_color.dart';
import 'package:fooseonline/assets/app_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:const BoxDecoration(
            color: AppColors.mainColor
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      Stack(

                        children:[
                          Container(
                          height: 385,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              color: Colors.grey
                          ),
                        ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width-120,top: 25),
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.amber
                            ),
                            child: AppText(text: "Available",color: Colors.black,),
                          )
                        ]
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(text: "size: XL"),
                                Container(
                                  child: Row(
                                    children: [
                                      AppText(text: "GHC",size: 10,color: Colors.red,),
                                      AppText(text: "30.00",size: 17,color: Colors.red,),
                                    ],
                                  ),
                                )

                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black,
                                  ),
                                  child: AppText(text: "Buy Now",color: Colors.white,size: 14,),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5
                                    ),
                                  ),
                                  child: AppText(text: "Buy + More",color: Colors.black,size: 14,),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
