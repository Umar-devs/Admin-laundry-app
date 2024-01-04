import 'package:admin/Auth/register.dart';
import 'package:admin/Auth/txt_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant/Constant.dart';
import '../View/Components/ReusableText.dart';
import 'auth_controller.dart';
import 'custom_btn.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginEmailTextController = TextEditingController();
  final loginPasswordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              SizedBox(height: screenHeight*0.05,),

              Image.asset(
                'assets/app icons-09.png',
                height: screenHeight * 0.17,
              ),
              Column(
                children: [
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.065,
                    clr: const Color(0xff063585),
                    title: 'Laundry',
                  ),
                  ReusableText(
                    weight: FontWeight.w500,
                    fontSize: screenWidth * 0.025,
                    clr: const Color(0xff063585),
                    title: 'The Laundry App',
                  ),
                ],
              ),
              SizedBox(height: screenHeight*0.05,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginEmailTextController,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    fieldIcon: Icon(
                      Icons.email,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Your Email'),
              ),
              SizedBox(height: screenHeight*0.02,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginPasswordTextController,
                    label: 'Password',
                    fieldIcon: Icon(
                      Icons.lock,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Password'),
              ),
              SizedBox(height: screenHeight*0.05,),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: CustomBtn(
                    btnHeight: screenHeight * 0.067,
                    btnWidth: screenWidth,
                    onTapFunction: () {
                      controller.login(loginEmailTextController.text,
                          loginPasswordTextController.text);
                    },
                    txtWeight: FontWeight.w700,
                    txtFontSize: screenWidth * 0.04,
                    lbl: 'Login'),
              ),
              SizedBox(height: screenHeight*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.03,
                      title: 'Don`t have an account?', clr: Colors.black, ),
                  GestureDetector(
                      onTap: () {
                        Get.to(
                          RegisterScreen(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: ReusableText(
                        weight: FontWeight.w600,
                        fontSize: screenWidth * 0.035,
                        title: '  Register',
                        clr: Colors.black, 
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
