import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendsCard extends StatelessWidget {
  FriendsCard(
      {super.key,
      required this.portrait,
      required this.name,
      required this.country});

  String portrait;
  String name;
  String country;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black.withOpacity(0.2),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 45.spMax,
                backgroundColor: Colors.cyan,
                child: CircleAvatar(
                  radius: 40.spMax,
                  backgroundImage: NetworkImage(portrait),
                ),
              ),
              SizedBox(height: 20.h),
              Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.spMax, color: Colors.white)),
              SizedBox(height: 10.h),
              Text(country, style: TextStyle(fontSize: 16.spMax, color: Colors.white)),
            ],
          ),
        ));
  }
}
