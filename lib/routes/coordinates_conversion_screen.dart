import 'package:flutter/material.dart';

class CoordinatesConversionScreen extends StatefulWidget {
  CoordinatesConversionScreen({Key? key}) : super(key: key);

  @override
  State<CoordinatesConversionScreen> createState() =>
      _CoordinatesConversionScreenState();
}

class _CoordinatesConversionScreenState
    extends State<CoordinatesConversionScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Coordinates Converter'),
        ),
        backgroundColor: Colors.blue.shade500,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight * 0.36,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade800,
                    ],
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'UTM Coordinates',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
