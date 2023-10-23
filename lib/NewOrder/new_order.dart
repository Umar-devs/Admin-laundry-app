import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Constant/Constant.dart';
import '../DetailScreen/detail_screen.dart';
import '../HomeScreen/Components/home_screen.dart';
import '../View/Components/ReusableText.dart';

class NewOrdersScreen extends StatefulWidget {
  const NewOrdersScreen({super.key});

  @override
  State<NewOrdersScreen> createState() => _NewOrdersScreenState();
}

class _NewOrdersScreenState extends State<NewOrdersScreen> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Orders List');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text('Pending Orders'),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.05, top: screenHeight * 0.02),
          child: GestureDetector(
            onTap: () {
              Get.to(HomeScreen(),
                  duration: const Duration(milliseconds: 700),
                  transition: Transition.fadeIn);
            },
            child: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: databaseRef.orderByChild('status').equalTo('pending').onValue,
        builder: (
          context,
          snap,
        ) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: themeColor,
              ),
            );
          } else {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data?.snapshot.value != null) {
              Map<dynamic, dynamic>? data =
                  snap.data?.snapshot.value as Map<dynamic, dynamic>?;
              List<Map<String, dynamic>> item = [];

              data?.forEach((index, data) => item.add({"key": index, ...data}));

              return ListView.builder(
                // reverse: true,
                scrollDirection: Axis.vertical,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        title: Row(
                          children: [
                            ReusableText(
                              title: item[index]['package'],
                              fontSize: screenWidth * 0.035,
                              weight: FontWeight.w700,
                              clr: Colors.black,
                            ),
                            ReusableText(
                              title: '(${item[index]['price']})',
                              fontSize: 10,
                              weight: FontWeight.w400,
                              clr: Colors.black,
                            ),
                          ],
                        ),
                        // Text('Order Key ${item[index]['key']}'), for key
                        subtitle: ReusableText(
                            title: item[index]['time of order place'],
                            fontSize: screenWidth * 0.03,
                            weight: FontWeight.w500,
                            clr: Colors.black),
                        trailing: Container(
                          height: screenHeight * 0.035,
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                              color: themeColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: ReusableText(
                                title: 'Details',
                                fontSize: screenWidth * 0.03,
                                weight: FontWeight.w500,
                                clr: Colors.white),
                          ),
                        ),
                        onTap: () {
                          Get.to(
                              DetailScreen(
                                status: item[index]['status'],
                                package: item[index]['package'],
                                pickDate: item[index]['pickDate'],
                                pickTime: item[index]['pickTime'],
                                dropDate: item[index]['dropDate'],
                                dropTime: item[index]['dropTime'],
                                fragrance: item[index]['fragrance'],
                                detergent: item[index]['detergent'],
                                ind: item[index]['key'],
                                payInt: item[index]['datetimeEtc'],
                                notes: item[index]['notes'],
                                subtotal: item[index]['price'],
                                address: item[index]['address'],
                                userID: item[index]['userId'],
                                orderTime: item[index]['time of order place'],
                                firstStatusTitle: 'Active',
                                secStatusTitle: 'Cancelled',
                                firstBtnTitle: 'Active Order',
                                secBtnTitle: 'Cancel Order',
                                nextScreen: const NewOrdersScreen(),
                              ),
                              duration: const Duration(milliseconds: 700),
                              transition: Transition.fadeIn);
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                  child: ReusableText(
                title: 'No data',
                fontSize: screenWidth * 0.04,
                weight: FontWeight.w700,
                clr: Colors.black,
              ));
            }
          }
        },
      ),
    );
  }
}
