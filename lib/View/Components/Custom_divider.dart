import 'package:flutter/material.dart';



class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key,  this.clr=const Color.fromARGB(255, 209, 209, 209)});
final Color clr;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      height: 1,
      color: clr,
     
    );
  }
}
