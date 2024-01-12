import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/testpage.dart';
import 'package:gsc2024/view/components/profile_button.dart';
import 'components/afterconnect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:gsc2024/view/solutionpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 26, right: 26, bottom: 26),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //heade & return button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColor.kTextColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Profil',
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),

            //Profile
            Column(children: [
              //image
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: EdgeInsets.only(top: 36),
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.6,
                        ),
                      ),
                    )),
              ]),
              //name & address
              Column(
                children: [
                  //name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 36),
                        child: Text(
                          'Aryiana',
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
                            Icon(
                              Icons.location_on_sharp,
                              color: AppColor.kTextColor,
                            ),
                            SizedBox(width: 8), // Adjust the width as needed
                            Text(
                              'Gn. Kidul, Jawa Tengah',
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
              )
            ]),

            //Button
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to solutionpage.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SolutionPage()),
                    );
                  },
                  child: ProfileButton(
                    icon: SvgPicture.asset(
                      'assets/images/profile.svg',
                      width: 20,
                      height: 20,
                    ),
                    text: "Personal Data",
                  ),
                ),

                // Real code
                // ProfileButton(
                //   icon: SvgPicture.asset(
                //     width: 20,
                //     height: 20,
                //     'assets/images/profile.svg',
                //   ),
                //   text: "Personal Data",
                // ),
                ProfileButton(
                  icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    'assets/images/pin-bottom.svg',
                  ),
                  text: "Device Information",
                ),
                ProfileButton(
                  icon: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    'assets/images/whatsapp.svg',
                  ),
                  text: "Contact Center",
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineThickness: 1.0,
                  dashGapLength: 4.0,
                  lineLength: double.infinity,
                  dashColor: Colors.grey,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
