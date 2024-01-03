import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/solutioncard.dart';
import 'package:gsc2024/view/components/solutionstep.dart';
import 'package:gsc2024/view/homepage.dart';
import 'package:gsc2024/view/testpage.dart';
import 'package:dotted_line/dotted_line.dart';

class SolutionPage extends StatelessWidget {
  const SolutionPage({super.key});

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
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SolutionStep(
                    text: 'Step 1',
                    isActive: true,
                  ),
                  SolutionStep(
                    text: 'Step 2',
                    isActive: false,
                  ),
                  SolutionStep(
                    text: 'Step 3',
                    isActive: false,
                  ),
                  SolutionStep(
                    text: 'Step 4',
                    isActive: false,
                  ),
                ],
              ),
              const SizedBox(height: 58),
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
                        SolutionCard(
                          text: 'Nitrate Levels',
                          isActive: true,
                        ),
                        SolutionCard(
                          text: 'Chlorine Levels',
                          isActive: false,
                        ),
                        SolutionCard(
                          text: 'TDS Levels',
                          isActive: false,
                        ),
                        SolutionCard(
                          text: 'pH',
                          isActive: false,
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
                          HomePage(),
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
