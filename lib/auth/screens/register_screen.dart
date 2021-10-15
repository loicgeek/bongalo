import 'package:bongalo_recruitment/auth/screens/otp_verification_screen.dart';
import 'package:bongalo_recruitment/utils/app_colors.dart';
import 'package:bongalo_recruitment/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPhone = false;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'CM';
  String? phone;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/login_bg.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: screenHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/login_filter.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: screenHeight,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * .12,
                        ),
                        if (!showPhone)
                          RichText(
                            text: TextSpan(
                              text: "Book ",
                              style: TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .2,
                              ),
                              children: [
                                TextSpan(
                                  text: "ahead ",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 37,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: .2,
                                  ),
                                ),
                                TextSpan(
                                  text: "your next trip or vacation",
                                  style: TextStyle(
                                    fontSize: 37,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                    letterSpacing: .2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (showPhone)
                          Text(
                            "Create Account ",
                            style: TextStyle(
                              fontSize: 37,
                              fontWeight: FontWeight.w700,
                              letterSpacing: .2,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        SizedBox(
                          height: screenHeight * .12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!showPhone) ...[
                            AppButton(
                              text: "Create Account",
                              onTap: () {
                                setState(() {
                                  showPhone = !showPhone;
                                });
                              },
                            ),
                            AppButton(
                              text: "Login",
                              bgColor: Colors.white,
                              textColor: AppColors.primary,
                            ),
                          ],
                          if (showPhone) ...[
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  phone = number.phoneNumber!
                                      .replaceFirst(number.dialCode!, "");
                                  setState(() {});
                                },
                                spaceBetweenSelectorAndTextField: 0,
                                onInputValidated: (bool value) {},
                                ignoreBlank: true,
                                hintText: "70353457753",
                                autoValidateMode: AutovalidateMode.disabled,
                                initialValue: PhoneNumber(isoCode: 'NG'),
                                textFieldController: controller,
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DROPDOWN,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppButton(
                              text: "Continue",
                              disabled: (phone == null ||
                                  (phone != null && phone!.isEmpty)),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        OtpVerificationScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17.0),
                            child: Text(
                              "Or",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          AppButton(
                            text: "Continue with Apple",
                            bgColor: Colors.white,
                            textColor: AppColors.primaryText,
                            leading: Image.asset(
                              "assets/images/apple_logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          AppButton(
                            text: "Continue with Google",
                            bgColor: Colors.white,
                            textColor: AppColors.primaryText,
                            leading: Image.asset(
                              "assets/images/google_logo.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
