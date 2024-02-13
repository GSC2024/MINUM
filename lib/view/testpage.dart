import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/testdetail.dart';
import 'package:gsc2024/view/components/watercup.dart';
import 'package:gsc2024/view/homepage.dart';
import 'package:gsc2024/view/solutionpage.dart';
import '../features/data_fetch/data_service.dart';
import '../features/user_data.dart';

class TestPage extends StatefulWidget {
  final String userId;
  const TestPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late String userId;
  final DataService _dataService = DataService();
  UserData? userData;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 26, right: 26, bottom: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    HomePage(
                              userId: userId,
                            ),
                          ),
                        );
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
                        'Uji Air',
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
              const SizedBox(height: 73),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '80%',
                        style: TextStyle(
                          color: AppColor.kButtonColor,
                          fontSize: 40,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Kelayakan',
                        style: TextStyle(
                          color: AppColor.kTextColor,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 70),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter: GlassPainter(
                            0.8), // 80% filled //TODO: Make this the dynamic value
                        size: Size(150, 200), // size of the cup
                      ),
                      Text(
                        'Minum.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Archia',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text(
                'Detail Pengujian',
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 8),
              TestDetail(
                detailTitle: 'Tingkat pH',
                pointColor: Color(0xFFA1F99F),
                detailValue: userData?.ph.toString() ?? 'N/A',
              ),
              TestDetail(
                detailTitle: 'Tingkat TDS',
                pointColor: Color(0xFFF9D59F),
                detailValue: userData?.tds.toString() ?? 'N/A',
              ),
              TestDetail(
                detailTitle: 'Tingkat ORP',
                pointColor: Color(0xFFF99F9F),
                detailValue: userData?.temperature.toString() ?? 'N/A',
              ),
              SizedBox(height: 100),
              PageButton(
                text: 'Tangani Sekarang!',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SolutionPage(
                        userId: userId,
                        ph: userData?.ph?.toDouble() ?? 0,
                        tds: userData?.tds?.toDouble() ?? 0,
                        orp: userData?.temperature?.toDouble() ?? 0,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
