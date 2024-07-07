import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:weather_app/additional_features.dart';
import 'package:weather_app/forecasting.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/toHide.dart';

class MyHomePage extends StatefulWidget{
  late String cityName;
   MyHomePage({Key? key, required this.cityName}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //cityName = ModalRoute.of(context)?.settings.arguments as String? ?? 'London';
    currentWeather();
  }

  Future<Map<String, dynamic>> currentWeather() async{
    try{
    //String cityName = "London";

    final result = await http.get(
      
      Uri.parse(
        'http://api.openweathermap.org/data/2.5/forecast?q=${widget.cityName}&APPID=$weaterAPIkey'
      ),
      );
      final data = jsonDecode(result.body);

      if(data['cod']!='200'){
        throw "unexpected error occured";
      }

      return data;

      
    
    }catch (e){
      throw e.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 234, 203),
        centerTitle: true,
        title: const Text("Weather App", 
        style: TextStyle(
          
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        ),
        actions: [
          IconButton(
             onPressed: () { 
              setState(() {
                
              });
              }, 
             icon: const Icon(Icons.refresh, size: 28),   
          )
        ],
      ),
      body:  FutureBuilder(
        future: currentWeather(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: const CircularProgressIndicator.adaptive());

          };
          

          if(snapshot.hasError ){
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data!;

          final CurrentTemp = data["list"][0]["main"]["temp"]; 
          final sky = data["list"][0]["weather"][0]["main"];
          final pressure = data["list"][0]["main"]["pressure"];
          final windSpeed = data ["list"][0]["wind"]["speed"];

          final humidity =data["list"][0]["main"]["humidity"]; 
          return 
        
       Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            //weather main card
             Card(
              color:  Color.fromARGB(255, 248, 216, 119),
              elevation: 10,
              child: SizedBox(
                width: double.maxFinite,
        
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Text(" $CurrentTemp K",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    ),
                
                    SizedBox(height: 16),
                
                    Icon(sky == "Clouds" || sky == "Rain" 
                    ? Icons.cloud
                    : Icons.sunny,
                    size: 34,
                    ),
                
                    SizedBox(height: 16),
                
                    Text(sky,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    ),
                    SizedBox(height: 16),
                
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            const SizedBox(
              width: double.maxFinite,
              child: Text("Weather Forecast", 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              ),
            
            ),
            SizedBox(height: 8),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  
                  for (int i=1; i<=5; i++) ...[
                  //final timelapse = data["list"][i]['dt_txt'];
                  MyWethearCard(
                    time: DateFormat.j().format(DateTime.parse(data["list"][i]['dt_txt'])),
                    iconpp: data["list"][i]["weather"][0]["main"]=="Clouds" ||
                    data["list"][i]["weather"][0]["main"]=="Rain" ? Icons.cloud
                    :Icons.sunny,
                    temp: data["list"][i]["main"]["temp"].toString(),
                  ),
                  ]
                  
                ],
              
              ),
            ),
            
            //scroll bar horizzonaatal
            
            SizedBox(height: 16),
            const SizedBox(
              width: double.maxFinite,
              child: Text("Additional Features", 
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalFeatures(
                  iconp: Icons.water_drop,
                  feature: "Humidity",
                  value: humidity.toString(),
                ),
                AdditionalFeatures(
                  iconp: Icons.air,
                  feature: "Wind Speed",
                  value: windSpeed.toString(),
                ),
                AdditionalFeatures(
                  iconp: Icons.umbrella_rounded,
                  feature: "Pressure",
                  value: pressure.toString(),
                ),
              ],
            )
          ],
        
        ),
      );
      })
    );
  }
}



