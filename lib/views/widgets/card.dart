import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget for users card
class FriendsCard extends StatelessWidget {
  const FriendsCard(
      {super.key,
      required this.portrait,
      required this.name,
      required this.country});

  final String portrait;
  final String name;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black.withOpacity(0.2),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45.spMax, // control responsive
                backgroundColor: Colors.cyan,
                child: CircleAvatar(
                  radius: 40.spMax, // control responsive
                  backgroundImage: NetworkImage(portrait),
                ),
              ),
              SizedBox(height: 20.h),
              Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.spMax, color: Colors.white)),
              SizedBox(height: 10.h),
              Text(country,
                  style: TextStyle(fontSize: 16.spMax, color: Colors.white)),
            ],
          ),
        ));
  }
}
