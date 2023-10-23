import 'package:flutter/material.dart';
import '../Constant/Constant.dart';

class TxtField extends StatelessWidget {
  const TxtField(
      {super.key,
        required this.label,
        this.customWidth = double.infinity,
        this.textEditingController,
        required this.errorMessage,
        this.fieldIcon,
        this.keyboardType,  this.hidePassword=false,  this.wantError=true,
      });
  final String label;
  final double customWidth;
  final TextEditingController? textEditingController;
  final String errorMessage;
  final Icon? fieldIcon;
  final TextInputType? keyboardType;
  final bool hidePassword;
  final bool wantError;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: screenHeight * 0.067,
        width: customWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.all(Radius.circular(screenWidth * 0.025))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: TextFormField(
              keyboardType: keyboardType,
              controller: textEditingController,
              decoration: InputDecoration(
                icon: fieldIcon,
                contentPadding: EdgeInsets.only(left: screenWidth * 0.03),
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.037,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return wantError? errorMessage:null;
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
