import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gsc2024/features/data_reset/reset_data.dart';
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
  final double? ph;
  final double? tds;
  final double? turbidity;
  const SolutionPage({
    Key? key,
    required this.userId,
    this.ph,
    this.tds,
    this.turbidity,
  }) : super(key: key);

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  late String userId;
  late double ph;
  late double tds;
  late double turbidity;
  late Color phColor;
  late Color tdsColor;
  late Color turbidityColor;

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    ph = widget.ph!;
    tds = widget.tds!;
    turbidity = widget.turbidity!;
    phColor = getDangerLevelph(ph);
    tdsColor = getDangerLeveltds(tds);
    turbidityColor = getDangerLevelturbidity(turbidity);
  }

  Color getDangerLevelph(double value) {
    if (value >= 6.5 && value <= 8.5) {
      return AppColor.kSafeColor;
    } else if (value >= 6 && value <= 9) {
      return AppColor.kWarningColor;
    } else {
      return AppColor.kDangerColor;
    }
  }

  Color getDangerLeveltds(double value) {
    if (value >= 50 && value <= 150) {
      return AppColor.kSafeColor;
    } else if (value >= 151 && value <= 250) {
      return AppColor.kWarningColor;
    } else {
      return AppColor.kDangerColor;
    }
  }

  Color getDangerLevelturbidity(double value) {
    if (value <= 20) {
      return AppColor.kSafeColor;
    } else if (value <= 40) {
      return AppColor.kWarningColor;
    } else {
      return AppColor.kDangerColor;
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
                                    TestPage(
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
              const SizedBox(height: 58), //58 //94
              Text(
                'Solusi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                'Penanganan Air',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.kTextColor,
                  fontSize: 28,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 40), //40 //60
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
                          isActive: true,
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          lineLength: 103,
                        ),
                        SolutionDot(
                          isActive: true,
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
                          title: 'Tingkat Kekeruhan',
                          pointColor: turbidityColor,
                          value: turbidity,
                          isActive: true,
                          step: 1,
                        ),
                        SolutionCardDetail(
                          userId: userId,
                          title: 'Tingkat TDS',
                          pointColor: tdsColor,
                          value: tds,
                          isActive: true,
                          step: 2,
                        ),
                        SolutionCardDetail(
                          userId: userId,
                          title: 'Tingkat pH',
                          pointColor: phColor,
                          value: ph,
                          isActive: true,
                          step: 4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 102),
              PageButton(
                text: 'Retest Water!',
                onTap: () {
                  resetField(userId, "PH", 0);
                  resetField(userId, "EC", 0);
                  resetField(userId, "TDS", 0);
                  resetField(userId, "Temperature", 0);
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

//SolutionCardDetail
class SolutionCardDetail extends StatelessWidget {
  const SolutionCardDetail({
    super.key,
    required this.userId,
    required this.title,
    required this.pointColor,
    required this.value,
    this.isActive,
    required this.step,
  });

  final String userId;
  final String title;
  final Color pointColor;
  final double value;
  final bool? isActive;
  final int step;

  @override
  Widget build(BuildContext context) {
    return SolutionCard(
      text: title,
      isActive: isActive ?? false,
      pointColor: pointColor,
      //if title is Nitrate Levels or Chlorine Levels the string will be "${value} pmm" else it will be "${value
      value: title == 'Tingkat TDS'
          ? '${value} PPM'
          : (title == 'Tingkat Kekeruhan' ? '$value NTU' : value.toString()),
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
              step: step,
            ),
          ),
        );
      },
    );
  }
}

//SolutionDot
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
