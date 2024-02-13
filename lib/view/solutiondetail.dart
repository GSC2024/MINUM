import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/solutionstep.dart';
import 'package:gsc2024/view/solutionpage.dart';

class SolutionDetail extends StatelessWidget {
  const SolutionDetail(
      {super.key,
      required this.value,
      required this.pointColor,
      required this.title,
      required this.userId,
      required this.step,
      this.ph});

  final String title;
  final Color pointColor;
  final double value;
  final String userId;
  final int step;
  final double? ph;

  String getMessage(String title, double value) {
    if (title == 'Tingkat pH') {
      if (value >= 6.5 && value <= 8.5) {
        return 'Air Bagus';
      } else if (value >= 6 && value <= 9) {
        return 'Air B aja';
      } else {
        return 'Air jelek ';
      }
    } else if (title == 'Tingkat TDS') {
      if (value >= 50 && value <= 150) {
        return 'Air Bagus';
      } else if (value >= 151 && value <= 250) {
        return 'Air B aja';
      } else {
        return 'Air jelek ';
      }
    } else {
      if (value >= 300 && value <= 400) {
        return 'Air Bagus';
      } else if (value >= 401 && value <= 600) {
        return 'Air B aja';
      } else {
        return 'Air jelek ';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 26, right: 26, bottom: 69),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SolutionStep(
                  text: 'Step ${step}',
                  isActive: true,
                ),
                SizedBox(height: 56),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: pointColor,
                        shape: OvalBorder(
                          side: BorderSide(
                              width: 1.60, color: AppColor.kTextColor),
                        ),
                      ),
                    ),
                    Text(
                      title == 'Tingkat TDS'
                          ? '$value PPM'
                          : (title == 'Tingkat ORP'
                              ? '$value mv'
                              : value.toString()),
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  getMessage(title, value),
                  //'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            PageButton(
              text: 'Next Step!',
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SolutionPage(
                      userId: userId,
                      ph: ph,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
