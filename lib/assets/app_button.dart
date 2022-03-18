import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String img;
  Color color;

   Buttons(
       {Key? key,
         required this.img,
         this.color=Colors.amber,

       }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 10),
      width: 50,
      height:50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color:color,
          image: DecorationImage(
              image: AssetImage("images/"+ img)
          )
      ),
    );
  }
}
