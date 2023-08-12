import 'package:flutter/material.dart';
import 'package:friends_app/controller/email_launcher.dart';
import 'info_container.dart';

class PortraitView extends StatelessWidget {
  PortraitView({
    super.key,
    required this.street,
    required this.postcode,
    required this.cityState,
    required this.country,
    required this.email,
    required this.phone,
  });

  String street;
  String postcode;
  String cityState;
  String country;
  String email;
  String phone;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          // InfoCon custom widget for carry users info
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
              onTap: () {
                emailUrlLauncher(email); // launching email app
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

class LandscapeView extends StatelessWidget {
  LandscapeView({
    super.key,
    required this.street,
    required this.postcode,
    required this.cityState,
    required this.country,
    required this.email,
    required this.phone,
  });

  String street;
  String postcode;
  String cityState;
  String country;
  String email;
  String phone;

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
            onTap: () {
              emailUrlLauncher(email); // launching email app
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
