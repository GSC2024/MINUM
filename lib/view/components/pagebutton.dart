import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class PageButton extends StatelessWidget {
  const PageButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          text,
          style: TextStyle(
            color: AppColor.kBackgroundColor,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
