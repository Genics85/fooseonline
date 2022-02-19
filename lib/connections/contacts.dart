import 'package:async/async.dart';
import 'package:url_launcher/url_launcher.dart';


class Contact{
  final url="https://wa.me/0547800363";

  final phoneNumber="0547800363";

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