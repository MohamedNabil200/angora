import 'package:flutter/material.dart';
import 'package:weatherapi/icons/icon.dart';
import 'package:weatherapi/Services/weather_services.dart';
import 'package:weatherapi/Models/weather_api.dart';
import 'package:lottie/lottie.dart';

class Header extends StatefulWidget {

  String ? city_name;
  String ? state_name;
  String ? temp;
  String ? descriptionimg;
  String ? description;
  Color ? backgroundColor;
    Header({ this.backgroundColor,
  this.city_name, this.description, this.state_name, this.temp,this
          .descriptionimg} ) ;





  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  WeatherServices weatherServices =WeatherServices();
  IconData textfieldclearicon=Icons.clear;
  var textfieldcontroller=TextEditingController();
  bool _isLoading= false;
  bool notfound=false;
  loadingFunc()async{
    await WeatherServices.getWeatherData();
    setState(() {
      _isLoading=false;

    });

  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height/3,
      backgroundColor: widget.backgroundColor,
      title: Padding(padding: const EdgeInsets.only(top: 25) ,child: Column
        (children: [_isLoading ? Lottie.network(rainyIcon,height: 50):Container(
        width: 700,
        height: 50,
        child: TextField(
          controller: textfieldcontroller,
          onSubmitted: (value){
            setState(() {
              _isLoading=true;
              city=value;
              Future.delayed(Duration(seconds: 1),(){
                loadingFunc();
                textfieldcontroller.clear();
              });
            });

        },
          style: TextStyle(
            color: Colors.white,
            decoration: InputDecoration(suffixIcon: IconButton(onPressed: ()
            {textfieldcontroller.clear();FocusScope.of(context).unfocus();
              )},icon: icon(textfieldcontroller))
          ),

        ),
      )],),),
    );
  }
}
