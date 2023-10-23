import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
import '../View/Components/ReusableText.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnHeight,
    required this.btnWidth,
    required this.onTapFunction,
    required this.txtWeight,
    required this.txtFontSize,
    required this.lbl,
  });
  final double btnHeight;
  final double btnWidth;
  final VoidCallback onTapFunction;
  final FontWeight txtWeight;
  final double txtFontSize;
  final String lbl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          height: btnHeight,
          width: btnWidth,
          decoration: const BoxDecoration(
              color: Color(0xff063585),
              borderRadius:
              BorderRadius.all(Radius.circular(5))),
          child: Center(
            child:  Align(
              alignment: Alignment.center,
              child: ReusableText(
                weight: txtWeight,
                fontSize: txtFontSize,
                clr: Colors.white, title: lbl,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
