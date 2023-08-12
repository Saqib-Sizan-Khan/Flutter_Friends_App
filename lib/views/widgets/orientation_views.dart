import 'package:flutter/material.dart';
import 'package:friends_app/controller/email_launcher.dart';
import 'info_container.dart';

// widget for showing views in portrait mode
class PortraitView extends StatelessWidget {
  const PortraitView({
    super.key,
    required this.street,
    required this.postcode,
    required this.cityState,
    required this.country,
    required this.email,
    required this.phone,
  });

  final String street;
  final String postcode;
  final String cityState;
  final String country;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // showing user info in list style
          ListInfo(
              title: "Address",
              contents: 'Street: $street\nPostCode: $postcode',
              image: 'assets/images/address.png'),
          ListInfo(
              title: "City and State",
              contents: cityState,
              image: 'assets/images/city.png'),
          ListInfo(
              title: "Country",
              contents: country,
              image: 'assets/images/country.png'),
          InkWell(
              // launching email app
              onTap: () {
                emailUrlLauncher(email);
              },
              child: ListInfo(
                  title: "Email",
                  contents: email,
                  image: 'assets/images/email.png')),
          ListInfo(
              title: "Cell Phone",
              contents: phone,
              image: 'assets/images/phone.png'),
        ],
      ),
    );
  }
}

// widget for showing views in landscape mode
class LandscapeView extends StatelessWidget {
  const LandscapeView({
    super.key,
    required this.street,
    required this.postcode,
    required this.cityState,
    required this.country,
    required this.email,
    required this.phone,
  });

  final String street;
  final String postcode;
  final String cityState;
  final String country;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1.7),
      padding: const EdgeInsets.all(8),
      children: [
        // showing user info in grid style
        GridInfo(
            title: "Address",
            contents: 'Street: $street\nPostCode: $postcode',
            image: 'assets/images/address.png'),
        GridInfo(
            title: "City and State",
            contents: cityState,
            image: 'assets/images/city.png'),
        GridInfo(
            title: "Country",
            contents: country,
            image: 'assets/images/country.png'),
        InkWell(
            // launching email app
            onTap: () {
              emailUrlLauncher(email);
            },
            child: GridInfo(
                title: "Email",
                contents: email,
                image: 'assets/images/email.png')),
        GridInfo(
            title: "Cell Phone",
            contents: phone,
            image: 'assets/images/phone.png'),
      ],
    );
  }
}
