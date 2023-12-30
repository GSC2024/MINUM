import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsc2024/view/components/historycard.dart';
import 'package:gsc2024/view/components/homecard.dart';
import 'package:gsc2024/view/components/homeicon.dart';
import '../../model/constants.dart';

class AfterConnectPage extends StatelessWidget {
  const AfterConnectPage({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 14,
                  'assets/images/battery.svg',
                ),
                iconText: 'Baterai',
                iconValue: '50%',
              ),
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 20,
                  'assets/images/water.svg',
                ),
                iconText: 'Pengujian',
                iconValue: '3X',
              ),
              HomeIcon(
                iconImage: SvgPicture.asset(
                  width: 24,
                  'assets/images/gear.svg',
                ),
                iconText: 'Kalibrasi',
              ),
            ],
          ),
          HomeCard(
            cardText: 'Uji Kelayakan \nAir Sekarang!',
            onTap: onTap, // () {}, //TODO: Add onTap function
          ),
          SizedBox(height: 56),
          Text(
            'Data Kualitas Air',
            style: TextStyle(
              color: AppColor.kTextColor,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 170,
            width: double.infinity,
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              'Chart',
            ),
          ),
          SizedBox(height: 36),
          Container(
            height: 76,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <HistoryCard>[
                HistoryCard(
                  mainPercentage: 50,
                  diffPercentage: '+ 10.4%',
                  date: DateTime.now(),
                ),
                HistoryCard(
                  mainPercentage: 50,
                  diffPercentage: '+ 10.4%',
                  date: DateTime.now(),
                ),
                HistoryCard(
                  mainPercentage: 50,
                  diffPercentage: '+ 10.4%',
                  date: DateTime.now(),
                ),
                HistoryCard(
                  mainPercentage: 50,
                  diffPercentage: '+ 10.4%',
                  date: DateTime.now(),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Created with Hope & Love',
            style: TextStyle(
              color: AppColor.kTextColor.withOpacity(0.3),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
