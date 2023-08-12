import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListInfo extends StatelessWidget {
  ListInfo(
      {super.key,
      required this.title,
      required this.contents,
      required this.image});

  String title;
  String contents;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 100,
      child: Center(
        child: ListTile(
          leading: Image.asset(image, scale: 12),
          title: Text(title,
              style: TextStyle(fontSize: 18.sp, color: Colors.cyan)),
          subtitle: Text(contents, style: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }
}

class GridInfo extends StatelessWidget {
  GridInfo(
      {super.key,
        required this.title,
        required this.contents,
        required this.image});

  String title;
  String contents;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: GridTile(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image, scale: 12),
              Text(title,
                  style: TextStyle(fontSize: 18.spMax, color: Colors.cyan)),
              Text(contents, style: TextStyle(fontSize: 16.spMax)),
            ],
          ),
        ),
      ),
    );
  }
}
