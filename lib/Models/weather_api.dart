import 'package:json_annotation/json_annotation.dart';

class Weather{
 final String ? city;
final double ? temp;
final String ? text;
 final String ? date;
final String ? state;
final int ? humidity;
 final double? uvIndex;
final double? wind;
final List ?forecast;
 Weather({ this.text, this.temp, this.city,this.date,
  this.uvIndex,this.state,
  this.forecast,
  this.wind,
  this.humidity});
factory Weather.fromjson(json){
 return Weather(
     text : json['current']['uv'],
     temp:json['current']['temp_c'],
     city:json['location']['name'],
     date:json['location']['localtime'],
     uvIndex:json['current']['uv'],

     state:json['location']['region'],
     forecast:json['forecast']['forecastday'][0]['hour'],
     wind:json['current']['wind_kph'],
     humidity:json['current']['humidity']
 );
}









}