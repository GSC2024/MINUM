import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/testdetail.dart';
import 'package:gsc2024/view/components/watercup.dart';
import 'package:gsc2024/view/solutionpage.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
                detailValue: '6.8',
              ),
              TestDetail(
                detailTitle: 'Tingkat TDS',
                pointColor: Color(0xFFF9D59F),
                detailValue: '3 pmm',
              ),
              TestDetail(
                detailTitle: 'Tingkat Nitrat',
                pointColor: Color(0xFFF99F9F),
                detailValue: '125',
              ),
              TestDetail(
                detailTitle: 'Tingkat Khlorida',
                pointColor: Color(0xFFF8F99F),
                detailValue: '2 pmm',
              ),
              SizedBox(height: 36),
              PageButton(
                text: 'Tangani Sekarang!',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SolutionPage(),
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
