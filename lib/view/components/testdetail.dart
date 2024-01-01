import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class TestDetail extends StatelessWidget {
  const TestDetail({
    super.key,
    required this.detailTitle,
    required this.pointColor,
    required this.detailValue,
  });

  final String detailTitle;
  final Color pointColor;
  final String detailValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 16,
                height: 16,
                decoration: ShapeDecoration(
                  color: pointColor,
                  shape: OvalBorder(
                    side: BorderSide(width: 1.60, color: Color(0xFF1F1F1F)),
                  ),
                ),
              ),
              Text(
                detailTitle,
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          Text(
            detailValue,
            style: TextStyle(
              color: Color(0xFF1F1F1F),
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
