import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsc2024/view/components/homecard.dart';
import 'package:gsc2024/view/testpage.dart';
import 'package:gsc2024/view/profilepage.dart';
import 'components/afterconnect.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isConnected = false;

  void pressed() {
    setState(() {
      isConnected = !isConnected;
      print('isConnected = $isConnected');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 59, left: 26, right: 26, bottom: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang!',
                        style: TextStyle(
                          color: AppColor.kTextColor,
                          fontSize: 20,
                          fontFamily: 'Archia',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Aryiana',
                        style: TextStyle(
                          color: AppColor.kTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  isConnected == true
                      ? InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          ),
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: Colors.grey,
                              shape: OvalBorder(side: BorderSide(width: 1.60)),
                            ),
                          ),
                        )
                      : Container(
                          width: 56,
                          height: 56,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: OvalBorder(side: BorderSide(width: 1.60)),
                          ),
                        ),

                ],
              ),

              //Before Connect
              // HomeCard(
              //   cardText: 'Sambungi \nAlat Sekarang!',
              //   onTap: () {}, //TODO: Add onTap function
              // ),

              //After Connect
              //AfterConnectPage(),

              isConnected == true
                  ? AfterConnectPage(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(),
                        ),
                      ),
                    )
                  : HomeCard(
                      cardText: 'Sambungi \nAlat Sekarang!',
                      onTap: pressed, //TODO: Add onTap function
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
