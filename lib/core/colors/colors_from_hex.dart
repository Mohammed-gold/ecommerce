import 'package:flutter/material.dart';

Color hextToColor(String hex) {
  hex = hex.replaceAll("#", "");
  if (hex.length == 6) {
    hex = "ff$hex";
  }
  return Color(int.parse(hex, radix: 16));
}
