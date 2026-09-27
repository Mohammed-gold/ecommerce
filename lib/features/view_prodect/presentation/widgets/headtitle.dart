import 'package:flutter/material.dart';

class Headtitel extends StatelessWidget {
  final String head;
  const Headtitel({super.key, required this.head});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            head,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Text(
          //     "See all",
          //     style: TextStyle(
          //       color: Colors.purple,
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
