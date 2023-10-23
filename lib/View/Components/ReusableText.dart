import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.weight,
      required this.clr,
      this.alignTxt});
  final String? title;
  final double fontSize;
  final FontWeight weight;
  final Color clr;
  final TextAlign? alignTxt;
  @override
  Widget build(BuildContext context) {
    return Text(title!,
        textAlign: alignTxt,
        style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: weight,
            color: clr,
            decoration: TextDecoration.none));
  }
}