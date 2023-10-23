import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
import '../View/Components/ReusableText.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            title: title,
            fontSize: screenWidth * 0.035,
            weight: FontWeight.w400,
            clr: themeColor),
        ReusableText(
            title: detail,
            fontSize: screenWidth * 0.035,
            weight: FontWeight.w500,
            clr: themeColor),
      ],
    );
  }
}
