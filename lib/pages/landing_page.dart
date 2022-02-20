import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooseonline/assets/app_color.dart';
import 'package:fooseonline/assets/post.dart';
import 'package:fooseonline/assets/search_space.dart';
import 'package:fooseonline/assets/side_bar.dart';

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
            color:Colors.white
          ),
          child: Stack(
            children:[
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context , index){
                    return Post();
                  }),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.topCenter,
                  child: Search()
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.5,right: 5),
                child: SideBar()
              )
            ]
          )
        ),
      )
    );
  }
}