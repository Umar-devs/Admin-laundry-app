import 'package:admin/Auth/login.dart';
import 'package:admin/Auth/txt_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/Constant.dart';
import '../Utils/utils.dart';
import '../View/Components/ReusableText.dart';
import 'auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key, required this.screenWidth, required this.screenHeight});
  final double screenWidth;
  final double screenHeight;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController controller = Get.put(AuthController());
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  final List hintTxt = [
    'Enter Email',
    'Enter Password',
    'Confirm Password',
  ];
  final List iconsList = [
    Icons.person,
    Icons.password,
    Icons.password,
  ];
  @override
  Widget build(BuildContext context) {
    final List controllersList = [
      emailTextController,
      passwordTextController,
      confirmPasswordTextController,
      nameController,
    ];

    return Container(
      height: widget.screenHeight,
      width: widget.screenWidth,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.screenHeight * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: widget.screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.center,
                child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: widget.screenWidth * 0.065,
                  clr: Colors.black,
                  title: 'Laundry App',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widget.screenWidth * 0.085,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: widget.screenHeight * 0.02,
                    title: 'Enter Details',
                    clr: const Color(0xff063585),
                  ),
                ),
              ),
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.073,
                  ),
                  child: TxtField(
                      label: hintTxt[i],
                      textEditingController: controllersList[i],
                      fieldIcon: Icon(
                        iconsList[i],
                        size: widget.screenWidth * 0.055,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      errorMessage: 'This Field is Empty!'),
                ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.screenWidth * 0.073,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      {
                        if (_formKey.currentState!.validate()) {
                          Utils().toastMessage('Working..');
                          if (passwordTextController.text !=
                              confirmPasswordTextController.text) {
                            Utils().toastMessage('Password not match');
                            return;
                          }

                          controller.signUp(
                              emailTextController,
                              passwordTextController,
                              nameController.text.toString(),
                              LoginScreen());
                        }
                      }
                    },
                    child: Container(
                      height: widget.screenHeight * 0.067,
                      width: widget.screenWidth,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ReusableText(
                          weight: FontWeight.w600,
                          fontSize: widget.screenWidth * 0.04,
                          title: 'Register',
                          clr: Colors.white,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: widget.screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
