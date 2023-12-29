import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsc2024/view/components/beforeconnect.dart';
import 'components/afterconnect.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 59, left: 26, right: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat datang!',
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Aryiana',
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: Color(0xFFCCCCCC),
                    shape: OvalBorder(side: BorderSide(width: 1.60)),
                  ),
                ),
              ],
            ),
            //BeforeConnectPage(),
            AfterConnectPage(),
          ],
        ),
      ),
    );
  }
}
