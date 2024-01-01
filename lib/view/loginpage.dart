import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/signuppage.dart';

import 'components/textinputfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    'Login Akun',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Email atau Nomor Telfon',
                ),
                SizedBox(height: 20),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Kata Sandi',
                ),
                // SizedBox(height: 8), //change from 4 (adjustment)
                // Container(
                //   width: double.infinity,
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Lupa Kata Sandi?',
                //     style: TextStyle(
                //       fontSize: 12, //change from 10 (adjustment)
                //       color: AppColor.kButonColor,
                //     ),
                //   ),
                // ),
                SizedBox(height: 37),

                PageButton(
                  text: 'Masuk',
                  onTap: () {}, //TODO: add function,
                ),
                SizedBox(height: 44),
                Text(
                  'Masuk Menggunakan',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: AppColor.kTextColor,
                  ),
                ),
                SizedBox(height: 12),
                Image.asset(
                    'assets/images/google.png'), //TODO: replace with actual google signin from firebase
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: AppColor.kTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Daftar Sekarang!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: AppColor.kButonColor,
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
}
