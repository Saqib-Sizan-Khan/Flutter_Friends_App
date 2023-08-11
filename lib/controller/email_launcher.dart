import 'package:url_launcher/url_launcher.dart';

emailUrlLauncher (String email) async {
  final url = Uri.parse(
      'mailto:$email?subject=Test&body=Test email');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Could not launch $url";
  }
}