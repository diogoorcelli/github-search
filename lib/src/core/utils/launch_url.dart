import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  static Future<void> address(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await canLaunchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
