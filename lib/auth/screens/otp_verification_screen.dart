import 'package:bongalo_recruitment/auth/screens/register_screen.dart';
import 'package:bongalo_recruitment/auth/screens/signup_screen.dart';
import 'package:bongalo_recruitment/utils/app_colors.dart';
import 'package:bongalo_recruitment/widgets/app_back_button.dart';
import 'package:bongalo_recruitment/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late TextEditingController pincodeController;
  bool isCompleted = false;

  @override
  void initState() {
    pincodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text("Verify"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * .05,
              ),
              Text(
                "We have sent a code to your number. ",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .2,
                  color: AppColors.primaryText,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Enter the code to verify your account.",
                  style: TextStyle(color: AppColors.grayScale),
                ),
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  activeFillColor: Colors.white,
                  selectedFillColor: Color.fromRGBO(241, 244, 252, 1),
                  inactiveFillColor: Color.fromRGBO(241, 244, 252, 1),
                  fieldHeight: screenWidth / 6,
                  fieldWidth: screenWidth / 6,
                  borderWidth: 1,
                ),
                enableActiveFill: true,
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                controller: pincodeController,
                onCompleted: (v) {
                  isCompleted = true;
                  print(v);
                  setState(() {});
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              AppButton(
                text: "Verify",
                disabled: !isCompleted,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: screenHeight * .05,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Didn't get the code? ",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: "Resend",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Resend code in ",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: "00:55",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
