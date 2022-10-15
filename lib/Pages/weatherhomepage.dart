import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weatherapi/Loading/loading_page.dart';
import 'package:weatherapi/Models/weather_api.dart';
import 'package:weatherapi/Services/weather_services.dart';
import 'package:weatherapi/colors/color.dart';

import '../icons/icon.dart';


class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  WeatherServices weatherServices =WeatherServices();
  Weather weather =Weather();
  String image='';
  Color defaultColor=Colors.black;
  int hour =0;
  bool isday=false;
  bool isNight=false;
  String icon='';
  bool isLoading=true;

  Future getweather()async{
   weather= (await WeatherServices.getWeatherData())?.cast<String>() as Weather;
   setState(() {
     getweather();
     isLoading=false;
   });
  }

  void setday() async{
    List datetime= weather.date!.split(' ');
    var hours=datetime[1]!.split(':');
    var turnint = int.parse(hours[0]);
    if(turnint>= 19 || turnint<=5){
      print(turnint);
      setState(() {
        isday=false;
        isNight=true;
        defaultColor=nightappbarcolor;
      });
    }
    if(turnint >5 && turnint <19){
      setState(() {
        isNight=false;
        isday=true;
        defaultColor=dayappbarcolor;
      });
    }
  }

  void day() async {
    setState(() {
      defaultColor = dayappbarcolor;
    });
    if (weather.text == 'Sunny') {
      setState(() {
        loadingIcon = sunnyIcon;
      });
    }
    if (weather.text == 'Overcast') {
      setState(() {
        loadingIcon = overcastDayIcon;
      });
    }
    if (weather.text == 'Partly cloud') {
      setState(() {
        loadingIcon = partlyCloudDayIcon;
      });
    }
  }

  void night() async{
    setState(() {
      defaultColor=nightappbarcolor;

    });
    if(weather.text=='partly cloud'){
      setState(() {
        loadingIcon=partlyCloudyIconNight;
      });
    }
    if(weather.text=='clear'){
      setState(() {
        loadingIcon=clearNightIcon;
      });
    }
  }
void gethour(){
    List datetime= weather.date!.split('');
    var hours=datetime[1].split(':');
    var turnint=int.parse(hours[0]);
    setState(() {
      hour=turnint;
    });
}
@override
  void initState() {
   getweather();
   Timer.periodic(Duration(seconds: 2), (timer) {setday();});
   Timer.periodic(Duration(seconds: 2), (timer) {isday? day():night();});
   Timer.periodic(Duration(seconds: 3), (timer) {gethour();});
   Future.delayed(Duration(seconds: 2),() async{
     await WeatherServices.getWeatherData();
     setState(() {
       isLoading=false;
     });
   });

   super.initState();
  }





  @override
  Widget build(BuildContext context) => isLoading?LoadingPage(): Scaffold();
}
