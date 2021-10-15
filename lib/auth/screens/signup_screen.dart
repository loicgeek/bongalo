import 'package:bongalo_recruitment/auth/screens/signup_success_screen.dart';
import 'package:bongalo_recruitment/utils/app_colors.dart';
import 'package:bongalo_recruitment/utils/validators.dart';
import 'package:bongalo_recruitment/widgets/app_back_button.dart';
import 'package:bongalo_recruitment/widgets/app_button.dart';
import 'package:bongalo_recruitment/widgets/app_input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: Text("Create Account"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 20.0,
                //     horizontal: 10,
                //   ),
                //   child: Image.asset("assets/images/bongalo.png"),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: Text("Let’s get to know you better"),
                ),
                SizedBox(
                  height: 20,
                ),
                AppInput(
                  controller: _nameController,
                  label: "Full name",
                  placeholder: "Enter full name",
                ),
                AppInput(
                  controller: _emailController,
                  label: "Email",
                  placeholder: "Enter email address",
                ),
                AppInput(
                  controller: _passwordController,
                  label: "Password",
                  placeholder: "Choose a password",
                  validator: (value) {
                    return Validators.validatePassword(
                        value, _nameController.text);
                  },
                  obscureText: true,
                ),

                SizedBox(
                  height: 45,
                ),

                AppButton(
                  text: "Create Account",
                  onTap: () {
                    _formKey.currentState!.validate();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpSucessScreen(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: AppColors.primaryGrayText,
                      ),
                      children: [
                        TextSpan(
                          text: "Login ",
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
