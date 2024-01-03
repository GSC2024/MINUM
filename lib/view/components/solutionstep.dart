import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class SolutionStep extends StatefulWidget {
  const SolutionStep({
    super.key,
    required this.text,
    required this.isActive,
  });

  final String text;
  final bool isActive;

  @override
  State<SolutionStep> createState() => _SolutionStepState();
}

class _SolutionStepState extends State<SolutionStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: widget.isActive ? AppColor.kButtonColor : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.isActive
              ? AppColor.kTextColor
              : AppColor.kTextColor.withOpacity(0.5),
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
