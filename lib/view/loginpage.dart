import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

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
                  width: 340, //change from 241 (adjustment)
                  image: AssetImage('assets/images/Frame2.png'),
                ),
                SizedBox(height: 56),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login Akun',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email atau Nomor Telfon',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColor.kTextColor.withOpacity(0.5),
                    ),
                    //border around the textfield
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.kTextColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.kButonColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Kata Sandi',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColor.kTextColor.withOpacity(0.5),
                    ),
                    //border around the textfield
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.kTextColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.kButonColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8), //change from 4 (adjustment)
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lupa Kata Sandi?',
                    style: TextStyle(
                      fontSize: 12, //change from 10 (adjustment)
                      color: AppColor.kButonColor,
                    ),
                  ),
                ),
                SizedBox(height: 37),
                InkWell(
                  onTap: null, //TODO: add function
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
                      'Masuk',
                      style: TextStyle(
                        color: AppColor.kBackgroundColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 44),
                Text(
                  'Masuk Menggunakan',
                  style: TextStyle(
                    fontSize: 14,
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
                        color: AppColor.kTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: null, //TODO: add function
                      child: Text(
                        'Daftar Sekarang!',
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
