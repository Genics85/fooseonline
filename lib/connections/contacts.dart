import 'package:url_launcher/url_launcher.dart';

class Contact{
  final url="https://wa.me/233547800363?text=Hey I'm texting you from my app";

  final phoneNumber="233547800363";

  void openWhatsappChat() async {

      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        enableJavaScript: true,
      );
}

  Future<void> openPhone() async {
    await launch(
      "tel:$phoneNumber"
        );
}

}