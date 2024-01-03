import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsc2024/model/constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardText,
    required this.onTap,
  });

  final String cardText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        height: 156,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.kButtonColor,
          border: Border.all(color: AppColor.kTextColor, width: 1.6),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  width: 31,
                  'assets/images/arrow.svg',
                ),
                Text(
                  cardText,
                  style: TextStyle(
                    color: AppColor.kBackgroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/thermometer.png',
            ),
          ],
        ),
      ),
    );
  }
}
