import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF542F76), Color(0xFFD99181)])),
      child: child,
    );
  }
}
