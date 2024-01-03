import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class SolutionCard extends StatefulWidget {
  const SolutionCard({
    super.key,
    required this.text,
    required this.isActive,
  });

  final String text;
  final bool isActive;

  @override
  State<SolutionCard> createState() => _SolutionCardState();
}

class _SolutionCardState extends State<SolutionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: EdgeInsets.only(bottom: 32),
      height: 86,
      width: double.infinity,
      decoration: ShapeDecoration(
        color:
            widget.isActive ? AppColor.kButtonColor : AppColor.kOffButtonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.6,
            color: AppColor.kTextColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: AppColor.kBackgroundColor,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
