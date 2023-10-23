import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:admin/HomeScreen/Components/home_screen.dart';

import 'Auth/login.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey='pk_test_51NaBipFStNFkbcMWNOSiZIVXiXLbE3X3t4VkU4mwJz556ByEZmCszD3A3AczCsBR78r5CK9EKIi6riOQwLqMOdoy00uVFvFb7x';
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User?user=FirebaseAuth.instance.currentUser;
    final Widget home;
    if(user!=null){
      home=HomeScreen();
    }
    else{
      home=LoginScreen();
    }
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:home,
    );
  }
}