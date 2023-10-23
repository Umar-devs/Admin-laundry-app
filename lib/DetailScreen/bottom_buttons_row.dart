import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Auth/custom_btn.dart';
import '../Constant/Constant.dart';
import '../HomeScreen/Components/home_screen.dart';
import '../Services/Payment Services/payment_service.dart';
import '../View/Components/ReusableText.dart';

class BottomBtnRow extends StatelessWidget {
    BottomBtnRow(
      {super.key,
      required this.status,
      required this.package,
      required this.pickDate,
      required this.pickTime,
      required this.dropDate,
      required this.dropTime,
      required this.fragrance,
      required this.detergent,
      required this.subtotal,
      required this.address,
      required this.notes,
      required this.ind,
      required this.payInt,
      required this.userID,
      required this.orderTime,
      required this.firstStatusTitle,
      required this.secStatusTitle,
      required this.firstBtnTitle,
      required this.secBtnTitle,
      required this.nextScreen,
      required this.isCancelScreen});
  final String status;
  final String package;
  final String pickDate;
  final String pickTime;
  final String dropDate;
  final String dropTime;
  final String fragrance;
  final String detergent;
  final String subtotal;
  final String address;
  final String notes;
  final String ind;
  final String payInt;
  final String userID;
  final String orderTime;
  final String firstStatusTitle;
  final String firstBtnTitle;
  final String secStatusTitle;
  final String secBtnTitle;
  final Widget nextScreen;
  final bool isCancelScreen;
  final PaymentController paymentController=Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Orders List').child(ind);

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.3,
              onTapFunction: () {
                Get.bottomSheet(Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: screenHeight * 0.2,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      ReusableText(
                          title: 'Change Status',
                          fontSize: screenWidth * 0.04,
                          weight: FontWeight.w600,
                          clr: themeColor),
                      // Divider(color: themeColor,indent: screenWidth*0.3,endIndent: screenWidth*0.3,),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          databaseRef.set({
                                  'status': firstStatusTitle,
                                  'address': address,
                                  'package': package,
                                  'datetimeEtc': payInt,
                                  'detergent': detergent,
                                  'dropDate': dropDate,
                                  'dropTime': dropTime,
                                  'fragrance': fragrance,
                                  'notes': notes,
                                  'pickDate': pickDate,
                                  'pickTime': pickTime,
                                  'price': subtotal,
                                  'time of order place': orderTime,
                                  'userId': userID,
                                });
                          Get.to(nextScreen,
                              duration: const Duration(milliseconds: 700),
                              transition: Transition.fadeIn);
                        },
                        child: Container(
                          height: isCancelScreen == true
                              ? screenHeight * 0.05
                              : screenHeight * 0.04,
                          width: screenWidth * 0.3,
                          color: themeColor,
                          child: Center(
                            child: ReusableText(
                                title: firstBtnTitle,
                                fontSize: screenWidth * 0.03,
                                weight: FontWeight.w500,
                                clr: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      isCancelScreen == true
                          ? const SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : GestureDetector(
                              onTap: () {
                                secBtnTitle=='Cancel Order'?
                                    {
                                paymentController.refundStripePayment(payInt),
                                databaseRef.set({
                                'status': secStatusTitle,
                                'address': address,
                                'package': package,
                                'datetimeEtc': payInt,
                                'detergent': detergent,
                                'dropDate': dropDate,
                                'dropTime': dropTime,
                                'fragrance': fragrance,
                                'notes': notes,
                                'pickDate': pickDate,
                                'pickTime': pickTime,
                                'price': subtotal,
                                'time of order place': orderTime,
                                'userId': userID,
                                  'Admin Status':'Refunded',
                                })
                                    }
                               :
                                databaseRef.set({
                                'status': secStatusTitle,
                                'address': address,
                                'package': package,
                                'datetimeEtc': payInt,
                                'detergent': detergent,
                                'dropDate': dropDate,
                                'dropTime': dropTime,
                                'fragrance': fragrance,
                                'notes': notes,
                                'pickDate': pickDate,
                                'pickTime': pickTime,
                                'price': subtotal,
                                'time of order place': orderTime,
                                'userId': userID,
                                });
                                Get.to(nextScreen,
                                    duration: const Duration(milliseconds: 700),
                                    transition: Transition.fadeIn);
                              },
                              child: Container(
                                height: screenHeight * 0.04,
                                width: screenWidth * 0.3,
                                color: themeColor,
                                child: Center(
                                  child: ReusableText(
                                      title: secBtnTitle,
                                      fontSize: screenWidth * 0.03,
                                      weight: FontWeight.w500,
                                      clr: Colors.white),
                                ),
                              ),
                            ),
                    ],
                  ),
                ));
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.03,
              lbl: 'Change Status'),
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.3,
              onTapFunction: () {
                Get.to(HomeScreen(),
                    duration: const Duration(milliseconds: 700),
                    transition: Transition.fadeIn);
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.03,
              lbl: 'Home'),
        ],
      ),
    );
  }
}
