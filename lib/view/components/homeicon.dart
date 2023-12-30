import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsc2024/model/constants.dart';

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
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
