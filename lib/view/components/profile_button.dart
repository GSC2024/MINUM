import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsc2024/model/constants.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final dynamic icon;

  const ProfileButton({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedLine(
          direction: Axis.horizontal,
          lineThickness: 1.0,
          dashGapLength: 4.0,
          lineLength: double.infinity,
          dashColor: Colors.grey,
        ),
        Container(
          height: 52,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0), // Adjust the left padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: icon,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColor.kTextColor, // Make sure AppColor is defined
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
