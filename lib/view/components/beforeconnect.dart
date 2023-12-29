import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/constants.dart';

class BeforeConnectPage extends StatelessWidget {
  const BeforeConnectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      padding: EdgeInsets.all(16),
      height: 156,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kButonColor,
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
                'Sambungi \nAlat Sekarang!',
                style: TextStyle(
                  color: AppColor.kBackgroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/images/thermometer.png',
          ),
        ],
      ),
    );
  }
}
