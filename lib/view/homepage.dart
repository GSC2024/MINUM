import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsc2024/view/components/homecard.dart';
import 'package:gsc2024/view/testpage.dart';
import '../features/data_fetch/data_service.dart';
import '../features/user_data.dart';
import 'package:gsc2024/view/profilepage.dart';
import 'components/afterconnect.dart';

class HomePage extends StatefulWidget {
  final String userId; // Add userId as a property
  HomePage({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String userId;
  final DataService _dataService = DataService();
  UserData? userData;
  //bool isConnected = false;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    _fetchData(userId);
  }

  Future<void> _fetchData(userId) async {
    try {
      if (userId != null) {
        UserData? fetchedUserData = await _dataService.fetchData(userId);
        setState(() {
          userData = fetchedUserData;
        });

        print('User Data: $userData');
      } else {
        print('User is not signed in or userId is null.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // void pressed() {
  //   setState(() {
  //     isConnected = !isConnected;
  //     print('isConnected = $isConnected');
  //   });
  // }

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
                        "${userData?.firstName} ${userData?.lastName}",
                        style: TextStyle(
                          color: AppColor.kTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 32,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  //isConnected == true ?
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          userId: userId,
                        ),
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
                  // : Container(
                  //     width: 56,
                  //     height: 56,
                  //     decoration: ShapeDecoration(
                  //       color: Colors.grey,
                  //       shape: OvalBorder(side: BorderSide(width: 1.60)),
                  //     ),
                  //   ),
                ],
              ),
              // isConnected == true
              //     ?
              AfterConnectPage(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestPage(userId: userId),
                  ),
                ),
              )
              // : HomeCard(
              //     cardText: 'Sambungi \nAlat Sekarang!',
              //     onTap: pressed, //TODO: Add onTap function
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
