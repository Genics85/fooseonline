import 'package:flutter/material.dart';
import 'app_text.dart';

class BuyMoreButton extends StatelessWidget {
   const BuyMoreButton({
     Key? key,
    required this.buttonColor,
    required this.buttonBorderColor,
     required this.textColor,
     required this.shadowColor
   }) : super(key: key);

  final Color buttonColor;
  final Color buttonBorderColor;
  final Color textColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: buttonColor,
          border: Border.all(
              color: buttonBorderColor,
              width: 1.5
          ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0,3)
            )
          ]

      ),
      child: AppText(text: "Add to Cart",color: textColor,size: 14,),
    );
  }
}
