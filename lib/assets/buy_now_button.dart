import 'package:flutter/material.dart';

import 'app_text.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const AppText(text: "Buy Now",color: Colors.white,size: 14,),
    );
  }
}
