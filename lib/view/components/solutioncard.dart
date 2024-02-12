import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class SolutionCard extends StatefulWidget {
  const SolutionCard({
    super.key,
    required this.text,
    required this.isActive,
    required this.pointColor,
    required this.value,
    required this.onTap,
  });

  final String text;
  final bool isActive;
  final Color pointColor;
  final String value;
  final VoidCallback onTap;

  @override
  State<SolutionCard> createState() => _SolutionCardState();
}

class _SolutionCardState extends State<SolutionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.only(bottom: 32),
        height: 86,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: widget.isActive
              ? AppColor.kButtonColor
              : AppColor.kOffButtonColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.6,
              color: AppColor.kTextColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: AppColor.kBackgroundColor,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 16,
                  height: 16,
                  decoration: ShapeDecoration(
                    color: widget.pointColor,
                    shape: OvalBorder(
                      side: BorderSide(
                          width: 1.60, color: AppColor.kBackgroundColor),
                    ),
                  ),
                ),
                Text(
                  widget.value,
                  style: TextStyle(
                    color: AppColor.kBackgroundColor,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Text(
              'Click here to view steps!',
              style: TextStyle(
                color: AppColor.kBackgroundColor,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
