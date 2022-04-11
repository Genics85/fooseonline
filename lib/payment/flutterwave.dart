import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class FlutterWavePayment with ChangeNotifier{

  final String currency = FlutterwaveCurrency.GHS;
  FlutterWavePayment();

  makePayment(BuildContext context,String paymentAmount,String reference) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: context,
          encryptionKey: "3f71e3c9a1fdd61411d18b63",
          publicKey: "FLWPUBK-7182149d239dfa6f2038dc638a8297f5-X",
          currency: currency,
          amount: paymentAmount,
          email: "eugeneamo85@gmail.com",
          fullName: "Fooseonline",
          txRef: reference,
          isDebugMode: false,
          phoneNumber: "0",
          acceptCardPayment: false,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: true,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false
      );

      final ChargeResponse response = await flutterwave.initializeForUiPayments();

      if (response==null){
        debugPrint("transaction failed");
      }else{
        debugPrint(response.message);
        debugPrint(response.status);
      }

    } catch(error) {
      debugPrint(error.toString());
    }
  }
}
