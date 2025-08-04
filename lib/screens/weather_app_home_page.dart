import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/additional_info_widget.dart';
import 'package:weather_app/widgets/comfort_lvl_widget.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/daily_forecast_widget.dart';
import 'package:weather_app/items/hourly_forecast_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherAppHomePage extends StatefulWidget {
  const WeatherAppHomePage({super.key});

  @override
  State<WeatherAppHomePage> createState() => _WeatherAppHomePageState();
}

class _WeatherAppHomePageState extends State<WeatherAppHomePage> {
  
  late Future<Map<String,dynamic>> weather;
  
  Future<Map<String,dynamic>> getCurrentWeather() async {
    
    try {
      String cityName = 'Delhi';
      String? openWeatherApiKey = dotenv.env['API_KEY'];
      
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey'
        ),
      );
      
      final data =jsonDecode(res.body);

      if(data['cod'] != '200'){
        throw 'An Unexpected Error Ocurred';
      } 

      return data;

    } catch(e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text(
                "Weather App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: (){
                    setState( (){
                      weather = getCurrentWeather();
                    });
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
            body: FutureBuilder(
              future: weather,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                final data = snapshot.data! ;
                final currentWeatherData = data['list'][0];
                final currentTemp = (currentWeatherData['main']['temp'] - 273.15).toStringAsFixed(0);
                final currrentSky = currentWeatherData['weather'][0]['main'];
                final currentWindSpeed = currentWeatherData['wind']['speed'].toString();
                final currentPressure = currentWeatherData['main']['pressure'].toString();
                final currentVisibility = (currentWeatherData['visibility'] / 1000).toString();
                final currentHumidity = currentWeatherData['main']['humidity'];
                final currentFeelLike = (currentWeatherData['main']['feels_like'] - 273.15).toStringAsFixed(2);
                final currentSeaLvl = currentWeatherData['main']['sea_level'].toString() ;
                String currentSkyAnimation = 'assets/sunny.json';
                if (currrentSky == 'Rain' || currrentSky == 'Drizzle'){
                  currentSkyAnimation = 'assets/rain.json';
                }if (currrentSky == 'Clouds'){
                  currentSkyAnimation = 'assets/partly cloud.json';
                }if (currrentSky == 'Thunderstorm'){
                  currentSkyAnimation = 'assets/storm.json';
                }if (currrentSky == 'Atmosphere'){
                  currentSkyAnimation = 'assets/mist.json';
                }

                

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: double.infinity,
                          alignment: Alignment.topCenter,
                          child: CurrentWeatherWidget(
                            currentTemp: currentTemp,
                            currentSky: currrentSky,
                            currentSkyAnimation: currentSkyAnimation,
                          ),
                        ),
                        SizedBox(height: 20,),
                        AdditionalInfoWidget(
                          currentWindSpeed: currentWindSpeed,
                          currentPressure: currentPressure,
                          currentVisibility: currentVisibility,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Hourly Forecast',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6,),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                            itemCount: 8,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context, index) {
                              final hourlyData = data['list'][index + 1];
                              final hourlySky = hourlyData['weather'][0]['main'];
                              final DateTime date = DateTime.parse(hourlyData['dt_txt']);
                              String hourlySkyAnimation = 'assets/sunny.json';
                              if (hourlySky == 'Rain' || hourlySky == 'Drizzle'){
                                hourlySkyAnimation = 'assets/rain.json';
                              }if (hourlySky == 'Clouds'){
                                hourlySkyAnimation = 'assets/partly cloud.json';
                              }if (hourlySky == 'Thunderstorm'){
                                hourlySkyAnimation = 'assets/storm.json';
                              }if (hourlySky == 'Atmosphere'){
                                hourlySkyAnimation = 'assets/mist.json';
                              }
                              return HourlyForecast(
                                time: DateFormat.j().format(date),
                                temp: (hourlyData['main']['temp'] - 273.15).toStringAsFixed(1),
                                icon: hourlySkyAnimation,
                                color: index == 0? Colors.deepPurpleAccent : null ,
                              );
                            },
                            ),
                        ),
                        SizedBox(height: 20,),
                        DailyForecastWidget(),
                        SizedBox(height: 25,),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.white30,
                        ),
                        SizedBox(height: 15,),
                        ComfortLevelWidget(
                          currentHumidity: currentHumidity,
                          currentFeelLike: currentFeelLike,
                          currentSeaLvl: currentSeaLvl,
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
    );
  }
}






