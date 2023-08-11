import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCon extends StatelessWidget {
  InfoCon({super.key, required this.title, required this.contents});

  String title;
  String contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 80,
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20.spMax, color: Colors.cyan)),
        subtitle: Text(contents, style: TextStyle(fontSize: 18.spMax)),
      ),
    );
  }
}