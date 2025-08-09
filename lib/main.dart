import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/screens/weather_app_home_page.dart';

Future<void> main() async {
  await dotenv.load();
  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: WeatherAppHomePage() ,
    );
  }
}

  