import 'package:flutter/material.dart';
import 'package:galleria/globals/color-pallette.dart';

class TextStyler {
  static final headingTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static final subTextStyle = TextStyle(
    fontSize: 16,
    color: ColorPallete.colors['lightText'],
  );
  static final titleTextStyle = TextStyle(
    fontSize: 18,
    color: ColorPallete.colors['strongText'],
    fontWeight: FontWeight.bold,
  );
  static final hyperLinkTextStyle = TextStyle(
    fontSize: 16,
    color: ColorPallete.colors['hyperText'],
    fontWeight: FontWeight.bold,
  );

  static final whiteTextStyle = TextStyle(
    fontSize: 16,
    color: ColorPallete.colors['whiteAction'],
    fontWeight: FontWeight.bold,
  );

  static final actionTextStyle = TextStyle(
    fontSize: 16,
    color: ColorPallete.colors['primaryColor'],
    fontWeight: FontWeight.bold,
  );
}
