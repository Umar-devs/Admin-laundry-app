import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
import '../View/Components/ReusableText.dart';
import 'bottom_buttons_row.dart';
import 'detail_row.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
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
    this.isCancelScreen = false,
  });
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
  final String secStatusTitle;
  final String firstBtnTitle;
  final String secBtnTitle;
  final Widget nextScreen;
  final bool isCancelScreen;
  Widget customDivider() {
    return Divider(
      color: Colors.grey.shade300,
      height: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: ReusableText(
              title: 'Details Screen',
              fontSize: screenWidth * 0.04,
              weight: FontWeight.w600,
              clr: Colors.white),
          centerTitle: true,
        ),
        body: Container(
          color: const Color(0xfff2f1f2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                notes.isEmpty
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: Image.asset(
                          'assets/white heavy check mark_ (1).png',
                          width: 110,
                          height: 110,
                        ),
                      )
                    : const Text(''),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    height: screenHeight * 0.52,
                    width: screenWidth * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(1, 1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ReusableText(
                                title: 'Order Details',
                                fontSize: screenWidth * 0.04,
                                weight: FontWeight.w600,
                                clr: themeColor),
                            ReusableText(
                                title: 'Ready Set Fold Service',
                                fontSize: screenWidth * 0.02,
                                weight: FontWeight.w400,
                                clr: themeColor),
                          ],
                        ),
                        Divider(
                          color: themeColor,
                          height: 0.5,
                          indent: screenWidth * 0.1,
                          endIndent: screenWidth * 0.1,
                        ),
                        DetailsRow(title: 'Status', detail: status),
                        customDivider(),
                        DetailsRow(title: 'Package', detail: package),
                        customDivider(),
                        DetailsRow(title: 'Pick Date', detail: pickDate),
                        customDivider(),
                        DetailsRow(title: 'Pick Time', detail: pickTime),
                        customDivider(),
                        DetailsRow(title: 'Drop Date', detail: dropDate),
                        customDivider(),
                        DetailsRow(title: 'Drop Time', detail: dropTime),
                        customDivider(),
                        DetailsRow(title: 'Fragrance', detail: fragrance),
                        customDivider(),
                        DetailsRow(title: 'Detergent', detail: detergent),
                        Divider(
                          color: themeColor,
                          height: 0.5,
                          indent: screenWidth * 0.1,
                          endIndent: screenWidth * 0.1,
                        ),
                        DetailsRow(title: 'Subtotal', detail: subtotal),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ReusableText(
                            title: 'Address',
                            fontSize: screenWidth * 0.035,
                            weight: FontWeight.w500,
                            clr: themeColor),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ReusableText(
                            title: address,
                            fontSize: screenWidth * 0.027,
                            weight: FontWeight.w400,
                            clr: themeColor),
                      )
                    ],
                  ),
                ),
                notes.isEmpty
                    ? SizedBox(
                        height: screenHeight * 0.01,
                      )
                    : Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.02),
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        height: screenHeight * 0.13,
                        width: screenWidth * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ReusableText(
                                  title: 'Notes',
                                  fontSize: screenWidth * 0.035,
                                  weight: FontWeight.w500,
                                  clr: themeColor),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ReusableText(
                                  title: notes,
                                  fontSize: screenWidth * 0.027,
                                  weight: FontWeight.w400,
                                  clr: themeColor),
                            )
                          ],
                        ),
                      ),
                BottomBtnRow(
                  ind: ind,
                  status: status,
                  package: package,
                  pickDate: pickDate,
                  pickTime: pickTime,
                  dropDate: dropDate,
                  dropTime: dropTime,
                  fragrance: fragrance,
                  detergent: detergent,
                  subtotal: subtotal,
                  address: address,
                  notes: notes,
                  payInt: payInt,
                  userID: userID,
                  orderTime: orderTime,
                  firstStatusTitle: firstStatusTitle,
                  secStatusTitle: secStatusTitle,
                  firstBtnTitle: firstBtnTitle,
                  secBtnTitle: secBtnTitle,
                  nextScreen: nextScreen,
                  isCancelScreen: isCancelScreen,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
