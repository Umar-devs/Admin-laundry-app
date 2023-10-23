import 'package:flutter/material.dart';

import '../../View/Components/ReusableText.dart';


class CardItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const CardItem(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 50.0,
              ),
              const SizedBox(height: 10.0),
              ReusableText(
                  title: text,
                  fontSize: 16,
                  weight: FontWeight.normal,
                  clr: const Color.fromARGB(255, 50, 50, 50))
            ],
          ),
        ),
      ),
    );
  }
}
