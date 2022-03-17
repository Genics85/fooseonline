import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:fooseonline/keys/public_key.dart';

class MakePayment{
  int price;
  BuildContext ctx;
  String email;
  MakePayment({required this.price,required this.ctx,required this.email});

  PaystackPlugin paystack=PaystackPlugin();

  Future initializePayment() async{
    await paystack.initialize(publicKey: Keys.PAYSTACK_PUBLIC_KEY);
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard getCard(){
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  chargeCardAndMakePayment() async{
    initializePayment().then((_) async{
      Charge charge=Charge()
          ..amount=price
          ..email=email
          ..reference=_getReference()
          ..card=getCard();
      CheckoutResponse response=await paystack.checkout(
          ctx,
          charge: charge,
          method: CheckoutMethod.selectable,
          fullscreen: false,
          logo: (FlutterLogo(
            size: 24,
          ))
      );
      if(response.status){
        return print("successful");
      }
      else{
        return print("failed");
      }
    });
  }
}