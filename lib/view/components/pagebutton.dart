import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class PageButton extends StatelessWidget {
  const PageButton({
    super.key,
    required this.onTap,
    required this.text,
    this.buttonColor,
  });

  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor != null ? buttonColor : AppColor.kButtonColor,
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
