import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/constants.dart';

class AfterConnectPage extends StatelessWidget {
  const AfterConnectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 14,
                  'assets/images/battery.svg',
                ),
                iconText: 'Baterai',
                iconValue: '50%',
              ),
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 14,
                  'assets/images/water.svg',
                ),
                iconText: 'Pengujian',
                iconValue: '3X',
              ),
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 24,
                  'assets/images/gear.svg',
                ),
                iconText: 'Kalibrasi',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
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
                      'Uji Kelayakan \nAir Sekarang!',
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
          ),
        ],
      ),
    );
  }
}

class HomeIcon extends StatelessWidget {
  HomeIcon({
    super.key,
    required this.iconText,
    this.iconValue,
    required this.iconImage,
  });

  final String iconText;
  String? iconValue;
  final SvgPicture iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              iconImage,
              SizedBox(width: 8),
              Text(
                iconValue ?? '',
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            iconText,
            style: TextStyle(
              color: AppColor.kTextColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
