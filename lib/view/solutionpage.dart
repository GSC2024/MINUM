import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';

class SolutionPage extends StatefulWidget {
  const SolutionPage({super.key});

  @override
  State<SolutionPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SolutionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 26, right: 26, bottom: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Header & Return button
            Container(
              alignment: Alignment.center,
              child: Text(
                'Step 1',
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 60.0, // Set your desired line length
              height: 2.0,
              color: Colors.lightBlue,
              margin: EdgeInsets.symmetric(vertical: 6.0),
            ),

            //Header & Quality
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 36),
                      child: Text(
                        'Nitrate Levels',
                        style: TextStyle(
                          color: AppColor.kTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 56),
                      child: Row(
                        children: [
                          Container(
                          width: 20, // Adjust the size of the circle as needed
                          height: 20, // Adjust the size of the circle as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow, // Set your desired color
                            border: Border.all(
                              color: Colors.black, // Set your desired border color
                              width: 1.6, // Set your desired border width
                            ),
                          ),
                          ),
                          SizedBox(width: 8), 
                          Text(
                            '3 pmm',
                            style: TextStyle(
                              color: AppColor.kTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            //Text
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(4.0), // Adjust padding as needed
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                  style: TextStyle(
                      color: AppColor.kTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                  ),
                ),
              ),
              // Add more widgets to the Column if needed
            ],
          )
          ],
        ),
      ),
    );
  }
}
