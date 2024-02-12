import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/solutioncard.dart';
import 'package:gsc2024/view/components/solutionstep.dart';
import 'package:gsc2024/view/homepage.dart';
import 'package:gsc2024/view/solutiondetail.dart';
import 'package:gsc2024/view/testpage.dart';
import 'package:dotted_line/dotted_line.dart';

class SolutionPage extends StatefulWidget {
  final String userId;
  const SolutionPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  late String userId;
  @override
  void initState() {
    super.initState();
    userId = widget.userId;
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
              //const SizedBox(height: 36),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SolutionStep(
              //       text: 'Step 1',
              //       isActive: true,
              //     ),
              //     SolutionStep(
              //       text: 'Step 2',
              //       isActive: false,
              //     ),
              //     SolutionStep(
              //       text: 'Step 3',
              //       isActive: false,
              //     ),
              //     SolutionStep(
              //       text: 'Step 4',
              //       isActive: false,
              //     ),
              //   ],
              // ),
              const SizedBox(height: 94), //58
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SolutionDot(
                          isActive: true,
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 103,
                        ),
                        SolutionDot(
                          isActive: false,
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 103,
                        ),
                        SolutionDot(
                          isActive: false,
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 103,
                        ),
                        SolutionDot(
                          isActive: false,
                        ),
                        SizedBox(height: 36),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        SolutionCardDetail(
                          userId: userId,
                          title: 'Nitrate Levels',
                          pointColor: Color(0xFFF99F9F),
                          value: '3 pmm',
                          isActive: true,
                        ),
                        SolutionCardDetail(
                          userId: userId,
                          title: 'Chlorine Levels',
                          pointColor: Color(0xFFF8F99F),
                          value: '2 pmm',
                        ),
                        SolutionCardDetail(
                          userId: userId,
                          title: 'TDS Levels',
                          pointColor: Color(0xFFF9D59F),
                          value: '125',
                        ),
                        SolutionCardDetail(
                          userId: userId,
                          title: 'pH',
                          pointColor: Color(0xFF9FF9A3),
                          value: '6.8',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              PageButton(
                text: 'Retest Water!',
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HomePage(
                        userId: userId,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SolutionCardDetail extends StatelessWidget {
  const SolutionCardDetail({
    super.key,
    required this.userId,
    required this.title,
    required this.pointColor,
    required this.value,
    this.isActive,
  });

  final String userId;
  final String title;
  final Color pointColor;
  final String value;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return SolutionCard(
      text: title,
      isActive: isActive ?? false,
      pointColor: pointColor,
      value: value,
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SolutionDetail(
              title: title,
              value: value,
              pointColor: pointColor,
              userId: userId,
            ),
          ),
        );
      },
    );
  }
}

class SolutionDot extends StatefulWidget {
  const SolutionDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  State<SolutionDot> createState() => _SolutionDotState();
}

class _SolutionDotState extends State<SolutionDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: ShapeDecoration(
        color: widget.isActive ? AppColor.kButtonColor : Colors.transparent,
        shape: OvalBorder(
          side: BorderSide(
            width: 1.60,
            color: AppColor.kTextColor,
          ),
        ),
      ),
    );
  }
}
