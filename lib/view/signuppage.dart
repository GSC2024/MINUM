import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsc2024/features/user_auth/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/homepage.dart';

import 'components/textinputfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    name2Controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 320, //change from 241 (adjustment)
                  image: AssetImage('assets/images/Frame2.png'),
                ),
                SizedBox(height: 56),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Buat Akun',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: nameController,
                  hintText: 'Nama Pertama',
                ),
                SizedBox(height: 20),
                TextInputField(
                  controller: name2Controller,
                  hintText: 'Nama Akhir',
                ),
                SizedBox(height: 20),
                TextInputField(
                  controller: emailController,
                  hintText: 'Email atau Nomor Telfon',
                ),
                SizedBox(height: 20),
                TextInputField(
                  controller: passwordController,
                  hintText: 'Kata Sandi',
                ),
                SizedBox(height: 20),
                TextInputField(
                  controller: password2Controller,
                  hintText: 'isi ulang Kata Sandi',
                ),
                SizedBox(height: 56),
                PageButton(
                  text: 'Buat Akun',
                  onTap: _signUp,
                ), //TODO: add proper function
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun?',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: AppColor.kTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Login Sekarang!',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: AppColor.kButtonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String name = nameController.text;
    String lastName = name2Controller.text;
    String email = emailController.text;
    String password = passwordController.text;

    Map<String, dynamic>? user =
        await _auth.signUpWithEmailAndPassword(email, password, name, lastName);

    if (user != null) {
      String userIds = user['userId'];
      print("User successfully created");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(userId: userIds),
        ),
      );
    } else {
      print("An error happened");
    }
  }
}
