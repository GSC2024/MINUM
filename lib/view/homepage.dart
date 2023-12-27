import 'package:flutter/material.dart';
import 'package:gsc2024/view/calibration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Water Tester App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Water Tester App',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'This is the home page',
              style: TextStyle(fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaLibrationPage()),
                );
              },
              child: Container(
                color: Colors.deepPurple,
                padding: EdgeInsets.all(20),
                child: Text('Calibrate Device'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
