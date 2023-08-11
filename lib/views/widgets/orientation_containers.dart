import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortraitContainer extends StatelessWidget {
  PortraitContainer({super.key, required this.name, required this.image});

  String name;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Colors.cyan,
          radius: 75.spMin,
          child: CircleAvatar(
            radius: 70.spMin,
            backgroundImage: NetworkImage(image),
          ),
        ),
        Text(name,
            style: TextStyle(
                fontSize: 28.spMax, color: Colors.white))
      ],
    );
  }
}

class LandScapeContainer extends StatelessWidget {
  LandScapeContainer({super.key, required this.name, required this.image});

  String name;
  String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Colors.cyan,
          radius: 110.spMin,
          child: CircleAvatar(
            radius: 100.spMin,
            backgroundImage: NetworkImage(image),
          ),
        ),
        Text(name,
            style: TextStyle(
                fontSize: 28.spMax, color: Colors.white))
      ],
    );
  }
}
