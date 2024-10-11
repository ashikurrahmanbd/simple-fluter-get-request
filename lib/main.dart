import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/homepage.dart';

void main (){
    runApp(MyApp());
}


class MyApp extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
        
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: Homepage()
        );
        
    }

}