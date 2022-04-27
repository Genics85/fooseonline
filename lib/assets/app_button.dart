import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  String img;
  Color color;
  
   Buttons(
       {Key? key,
         required this.img,
         this.color=Colors.grey,

       }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 10),
      width: 50,
      height:50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:color,
          image: DecorationImage(
              image: AssetImage("images/"+ img)
          )
      ),
    );
  }
}
