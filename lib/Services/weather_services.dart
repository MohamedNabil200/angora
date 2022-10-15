import 'dart:convert';
import 'dart:html';
import 'package:weatherapi/Models/weather_api.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';



class WeatherServices{
 static Future<List<Weather>?> getWeatherData() async{
      final uri = Uri.parse(
          'http://api.weatherapi.com/v1/forecast'
              '.json?key=f188a6d7554f4f808e615914222009&q=$city&days=3&aqi=no&alerts=no');
      final  response = await http.get(uri);


       if (response.statusCode == 200) {
            Weather.fromjson(jsonDecode(response.body));
         } else {
         throw Exception('failed');

    }
       return null;

  }
}
String city='Cairo';