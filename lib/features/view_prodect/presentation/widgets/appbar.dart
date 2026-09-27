import 'package:ecom/features/view_prodect/presentation/pages/catogery_v.dart';
import 'package:flutter/material.dart';

Appbarv(BuildContext context) {
  return AppBar(
    surfaceTintColor: Colors.white,
    toolbarHeight: 80,
    flexibleSpace: FlexibleSpaceBar(title: SizedBox(height: 20)),
    animateColor: true,
    backgroundColor: Colors.white,
    // centerTitle: true,
    title: SizedBox(
      height: MediaQuery.sizeOf(context).height / 17,
      width: MediaQuery.sizeOf(context).width,
      child: FloatingActionButton(
        backgroundColor: Colors.grey[200],

        isExtended: true,
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CatogeryVe(catid: 1)));
        },
        child: Row(
          children: [
            SizedBox(width: 15),
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 5),
            Text("Search in here", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}
