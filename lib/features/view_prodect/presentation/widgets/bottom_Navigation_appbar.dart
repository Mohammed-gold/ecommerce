import 'package:flutter/material.dart';

class BottomNavigationAppbarv extends StatefulWidget {
  const BottomNavigationAppbarv({super.key});

  @override
  BottomNavigationAppbarStatev createState() => BottomNavigationAppbarStatev();
}

class BottomNavigationAppbarStatev extends State<BottomNavigationAppbarv> {
  int d = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      currentIndex: d!,
      onTap: (value) {
        setState(() {
          d = value;
        });
      },

      items: [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_outlined)),

        BottomNavigationBarItem(
          label: "Category",
          icon: Icon(Icons.grid_view_rounded),
        ),
        BottomNavigationBarItem(
          label: "cart",
          icon: Icon(Icons.shopping_cart_outlined),
        ),
        BottomNavigationBarItem(
          label: "Orders",
          icon: Icon(Icons.receipt_long_outlined),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person_2_outlined),
        ),
      ],
    );
  }
}
