import 'package:flutter/material.dart';

class Headtitel extends StatelessWidget {
  final String head;
  const Headtitel({super.key, required this.head});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        head,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
