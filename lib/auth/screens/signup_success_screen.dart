import 'dart:math';

import 'package:bongalo_recruitment/utils/app_colors.dart';
import 'package:bongalo_recruitment/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignUpSucessScreen extends StatefulWidget {
  const SignUpSucessScreen({Key? key}) : super(key: key);

  @override
  _SignUpSucessScreenState createState() => _SignUpSucessScreenState();
}

class _SignUpSucessScreenState extends State<SignUpSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/male_head.png",
                      height: MediaQuery.of(context).size.width * .3,
                      width: MediaQuery.of(context).size.width * .3,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Congratulations",
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "You have successfully created an account. A stress-free life lies ahead of you.",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.grayScale,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: AppButton(
              text: "Continue",
            ),
          )
        ],
      ),
    );
  }
}
