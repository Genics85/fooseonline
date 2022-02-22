import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_set/state_set.dart';
import 'app_text.dart';

class Post extends StatefulWidget {

  Post({Key? key}) : super(key: key);

  int selectedPost=2;

  unisexSelected(){
    _PostState? state;
    state=StateSet.to<_PostState>();

    state?.setState(() {
      selectedPost=0;
    });
  }

  malesSelected(){
    _PostState? state;
    state=StateSet.to<_PostState>();

    state?.setState(() {
    selectedPost=1;
    });
  }

  femalesSelected(){
    _PostState? state;
    state=StateSet.to<_PostState>();

    state?.setState(() {
      selectedPost=2;
    });
  }

  kidsSelected(){
    _PostState? state;
    state=StateSet.to<_PostState>();

    state?.setState(() {
      selectedPost=3;
    });
  }


  List selection=[
    "images/unisex.jpg",
    "images/shirt2.jpg",
    "images/females.jpg",
    "images/kids.jpg",
  ];

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with StateSet {
   Post post= Post();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
                  offset: Offset(0,2)
                )
              ]
              
            ),
            child: Column(
              children: [
                Stack(

                    children:[
                      Container(
                        height: 385,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            color: Colors.grey,
                          image: DecorationImage(image: AssetImage(post.selection[post.selectedPost]),
                            fit: BoxFit.cover
                          )
                        ),
                      ),

                      //the available tag on each post

                      // Container(
                      //   child: Container(
                      //     padding: EdgeInsets.only(right: 20,top: 20),
                      //     alignment: Alignment.topRight,
                      //     child: Container(
                      //       alignment: Alignment.center,
                      //       width: 100,
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //           color: Colors.amberAccent.withOpacity(.6)
                      //       ),
                      //       child: AppText(text: "Available",color: Colors.black,),
                      //     ),
                      //   ),
                      // )
                    ]
                ),

                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: "size: XL",color: Colors.black,),
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
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0,3)
                                  )
                                ]
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
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(0,3)
                                  )
                                ]
                              
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
    );
  }
}
