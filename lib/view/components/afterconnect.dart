import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsc2024/features/save_data.dart';
import 'package:gsc2024/view/components/historycard.dart';
import 'package:gsc2024/view/components/homecard.dart';
import 'package:gsc2024/view/components/homeicon.dart';
import '../../features/data_fetch/data_service.dart';
import '../../model/constants.dart';

class AfterConnectPage extends StatefulWidget {
  final String userId;
  const AfterConnectPage({
    super.key,
    required this.onTap,
    required this.userId
  });

  final VoidCallback onTap;

  @override
  State<AfterConnectPage> createState() => _AfterConnectPageState();
}

class _AfterConnectPageState extends State<AfterConnectPage> {
  late String userId;
  final DataService _dataService = DataService();
  List<SaveData> saveDataList = [];

@override
void initState() {
  super.initState();
  userId = widget.userId;
  _fetchData(userId);
}

Future<void> _fetchData(String userId) async {
  try {
    if (userId != null) {
      List<SaveData> fetchedSaveData = await _dataService.fetchSaveData(userId); 
      setState(() {
        saveDataList = fetchedSaveData;
      });

      print('Save Data: $saveDataList');
    } else {
      print('User is not signed in or userId is null.');
    }
  } catch (error) {
    print('Error fetching data: $error');
  }
}



  
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
            onTap: widget.onTap, // () {}, //TODO: Add onTap function
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
          SizedBox(
  height: 76,
  width: double.infinity,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: saveDataList.length, // Use the length of the saveDataList
    itemBuilder: (context, index) {
      // Access each item in the saveDataList and create a HistoryCard widget
      final saveData = saveDataList[index];
      return HistoryCard(
        mainPercentage: saveData.percentage,
        diffPercentage: '10',
        date: DateTime.now(),
        lastCard: index == saveDataList.length - 1, // Set lastCard to true for the last item
      );
    },
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
