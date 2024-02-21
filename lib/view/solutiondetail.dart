import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:gsc2024/view/components/pagebutton.dart';
import 'package:gsc2024/view/components/solutionstep.dart';
import 'package:gsc2024/view/solutionpage.dart';

class SolutionDetail extends StatelessWidget {
  const SolutionDetail(
      {super.key,
      required this.value,
      required this.pointColor,
      required this.title,
      required this.userId,
      required this.step,
      this.ph});

  final String title;
  final Color pointColor;
  final double value;
  final String userId;
  final int step;
  final double? ph;

  String getMessage(String title, double value) {
    if (title == 'Tingkat pH') {
      if (value >= 6.5 && value <= 8.5) {
        return 'Tingkat pH layak untuk diminum!';
      } else if (value >= 6 && value <= 9) {
        return '''
Low pH:
pH 2 - 4: 
Add 4ml of lime juice to 100ml of water, and run through the test again

pH 4 - 6.5: 
Add 2ml of lime juice to 100ml of water, and run through the test again


High pH:
pH 8.5 - 10:
Add ¼ tsp of baking soda to 100ml of water, and run through the test again

pH >10 - 12: 
Add ½ tsp of baking soda to 100ml of water, and run through the test again

''';
      } else {
        return '''
Low pH:
pH 2 - 4: 
Add 4ml of lime juice to 100ml of water, and run through the test again

pH 4 - 6.5: 
Add 2ml of lime juice to 100ml of water, and run through the test again


High pH:
pH 8.5 - 10:
Add ¼ tsp of baking soda to 100ml of water, and run through the test again

pH >10 - 12: 
Add ½ tsp of baking soda to 100ml of water, and run through the test again
''';
      }
    } else if (title == 'Tingkat TDS') {
      if (value >= 50 && value <= 150) {
        return 'Tingkat TDS layak untuk diminum!';
      } else if (value >= 151 && value <= 250) {
        return '''
Bio-sand Filter

Materials:
1. Bottle or container
2. layers of fine cloth, 
    sized to cover the container surface
3. Sand
4. Gravel


Steps:
1. Create an exit point at the bottom or connect it to a tap (optional).

2. Place the first layer of cloth at the bottom of the container, ensuring it covers the water exit point.

3. Add a layer of gravel, ensuring it covers the entire surface of the container.

4. Add a thick layer of sand, covering the gravel layer completely.

5. Once all layers are added, cover the top with another fine cloth.

6. Ensure all layers are tightly packed, and flush water through the filter until it runs clear.
            ''';
      } else {
        return '''
Bio-sand Filter

Materials:
1. Bottle or container
2. layers of fine cloth, 
    sized to cover the container surface
3. Sand
4. Gravel


Steps:
1. Create an exit point at the bottom or connect it to a tap (optional).

2. Place the first layer of cloth at the bottom of the container, ensuring it covers the water exit point.

3. Add a layer of gravel, ensuring it covers the entire surface of the container.

4. Add a thick layer of sand, covering the gravel layer completely.

5. Once all layers are added, cover the top with another fine cloth.

6. Ensure all layers are tightly packed, and flush water through the filter until it runs clear.
            ''';
      }
    } else if (title == 'Tingkat Kekeruhan') {
      if (value <= 20) {
        return 'Tingkat Kekeruhan layak untuk diminum!';
      } else if (value <= 40) {
        return '''
Boiling

1. Boil water until it reaches 100 deg C or water starts to bubble. 

2. Once the water reaches 100°C and starts to bubble, turn off the heat and allow it to cool slightly.

3. Allow the water to sit undisturbed for some time to allow any remaining particles or sediment to settle at the bottom of the container. 

4. Once the water has cooled, pour it into a clean container, leaving the sediment behind.
''';
      } else {
        return '''
Boiling

1. Boil water until it reaches 100 deg C or water starts to bubble. 

2. Once the water reaches 100°C and starts to bubble, turn off the heat and allow it to cool slightly.

3. Allow the water to sit undisturbed for some time to allow any remaining particles or sediment to settle at the bottom of the container. 

4. Once the water has cooled, pour it into a clean container, leaving the sediment behind.
''';
      }
    } else {
      if (value >= 300 && value <= 400) {
        return 'Air kamu layak diminum!';
      } else if (value >= 401 && value <= 600) {
        return 'Air kamu kurang layak diminum';
      } else {
        return 'Air kamu belum layak diminum';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 26, right: 26, bottom: 69),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SolutionStep(
                  text: 'Step ${step}',
                  isActive: true,
                ),
                SizedBox(height: 52),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: pointColor,
                        shape: OvalBorder(
                          side: BorderSide(
                              width: 1.60, color: AppColor.kTextColor),
                        ),
                      ),
                    ),
                    Text(
                      title == 'Tingkat TDS'
                          ? '$value PPM'
                          : (title == 'Tingkat Kekeruhan'
                              ? '$value NTU'
                              : value.toString()),
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  height: 450,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      getMessage(title, value),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PageButton(
              text: 'Next Step!',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
