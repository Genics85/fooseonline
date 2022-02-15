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
                      Container(
                        height: 350,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
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
