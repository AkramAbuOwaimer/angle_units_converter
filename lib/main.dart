import 'package:angle_units_converter/routes/angles_conversion_screen.dart';
import 'package:angle_units_converter/routes/coordinates_conversion_screen.dart';
import 'package:angle_units_converter/routes/home_screen.dart';
import 'package:angle_units_converter/routes/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.blue, systemNavigationBarColor: Colors.blue),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GIS Converter Tools',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/angles_converter_screen': (context) => AnglesConversionScreen(),
        '/coordinates_converter_screen': (context) =>
            CoordinatesConversionScreen(),
      },
      initialRoute: '/launch_screen',
    );
  }
}
