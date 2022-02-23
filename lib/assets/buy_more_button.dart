import 'package:flutter/material.dart';

import 'app_text.dart';

class BuyMoreButton extends StatelessWidget {
  const BuyMoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
