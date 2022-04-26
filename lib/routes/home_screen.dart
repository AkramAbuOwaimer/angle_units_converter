import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text(
                    'Angles Conversion',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/angles_converter_screen');
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: const Text(
                    'Coordinates Conversion',
                    style: TextStyle(fontSize: 28),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/coordinates_converter_screen');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
