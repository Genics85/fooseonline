
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/assets/buy_more_button.dart';
import 'package:fooseonline/assets/buy_now_button.dart';
import 'app_text.dart';

class Post extends StatelessWidget {
  String img;
   Post({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          image: DecorationImage(image: AssetImage("images/"+img),
                            fit: BoxFit.cover
                          )
                        ),
                      ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
