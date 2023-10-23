import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Cancelled Orders/cancelled_orders.dart';
import '../../Completed Orders/completed_orders.dart';
import '../../Delivered/delivered.dart';
import '../../In Progress/in_progress.dart';
import '../../NewOrder/new_order.dart';
import '../../Ready To Deliver/ready_to_deliver.dart';
import '../../View/Components/ReusableText.dart';
import 'card_item.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  HomeScreen({Key? key});
  final databaseRef = FirebaseDatabase.instance.ref().child('path');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f1f2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 192, 220, 243),
        title: Image.asset(
          'assets/updated logo.png',
          height: 80.0,
          width: 80,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Padding(
                padding: EdgeInsets.all(16.0),
                child: ReusableText(
                    title: "Admin Panel",
                    fontSize: 22,
                    weight: FontWeight.w600,
                    clr: Color(0xff02348a))),
            Image.asset('assets/app icons-30.png',
                width: MediaQuery.of(context).size.width),
            const Padding(
                padding: EdgeInsets.all(16.0),
                child: ReusableText(
                    title: "Order",
                    fontSize: 22,
                    weight: FontWeight.w600,
                    clr: Color(0xff02348a))),
            GridView.count(
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              padding: const EdgeInsets.all(18.0),
              children: [
                CardItem(
                  image: 'assets/app icons-31.png',
                  text: 'New',
                  onTap: () {
                    Get.to(const NewOrdersScreen(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 700));
                  },
                ),
                CardItem(
                  image: 'assets/app icons-32.png',
                  text: 'In Progress',
                  onTap: () {
                    Get.to(const ActiveOrdersScreen(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.fadeIn);
                  },
                ),
                CardItem(
                  image: 'assets/app icons-33.png',
                  text: 'Completed',
                  onTap: () {
                    Get.to(const CompletedOrdersScreen(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.fadeIn);
                  },
                ),
                CardItem(
                  image: 'assets/app icons-34.png',
                  text: 'Cancelled',
                  onTap: () {
                    Get.to(const CancelledOrdersScreen(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.fadeIn);
                  },
                ),
                CardItem(
                  image: 'assets/app icons-32.png',
                  text: 'Ready to Deliver',
                  onTap: () {
                    Get.to(const ReadyToDeliverOrdersScreen(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.fadeIn);
                  },
                ),
                CardItem(
                  image: 'assets/app icons-32.png',
                  text: 'Delivered',
                  onTap: () {
                    Get.to(const DeliveredOrdersScreen(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.fadeIn);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
