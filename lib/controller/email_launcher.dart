import 'package:url_launcher/url_launcher.dart';

// route for redirect to email interface
emailUrlLauncher (String email) async {
  final url = Uri.parse(
      'mailto:$email?subject=Test&body=Test email'); // email url
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Could not launch $url";
  }
}