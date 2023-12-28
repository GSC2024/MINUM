import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/homepage.dart';

import 'components/textinputfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Nama Pertama',
                ),
                SizedBox(height: 20),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Nama Akhir',
                ),
                SizedBox(height: 20),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Email atau Nomor Telfon',
                ),
                SizedBox(height: 20),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'Kata Sandi',
                ),
                SizedBox(height: 20),
                TextInputField(
                  //controller: null, //TODO: add controller
                  hintText: 'isi ulang Kata Sandi',
                ),
                SizedBox(height: 56),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  ), //TODO: add proper function
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.kButonColor,
                      border: Border.all(
                        color: AppColor.kTextColor,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Buat Akun',
                      style: TextStyle(
                        color: AppColor.kBackgroundColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah memiliki akun?',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.kTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login Sekarang!',
                        style: TextStyle(
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
