import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget for showing info in ListTile
class ListInfo extends StatelessWidget {
  const ListInfo(
      {super.key,
      required this.title,
      required this.contents,
      required this.image});

  final String title;
  final String contents;
  final String image;

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
          leading: Image.asset(image, scale: 15),
          title: Text(title,
              style: TextStyle(fontSize: 16.spMax, color: Colors.cyan)),
          subtitle: Text(contents, style: TextStyle(fontSize: 14.spMax)),
        ),
      ),
    );
  }
}

// widget for showing info in GridTile
class GridInfo extends StatelessWidget {
  const GridInfo(
      {super.key,
      required this.title,
      required this.contents,
      required this.image});

  final String title;
  final String contents;
  final String image;

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
              Image.asset(image, scale: 20),
              Text(title,
                  style: TextStyle(fontSize: 14.spMax, color: Colors.cyan)),
              Text(contents, style: TextStyle(fontSize: 12.spMax)),
            ],
          ),
        ),
      ),
    );
  }
}
