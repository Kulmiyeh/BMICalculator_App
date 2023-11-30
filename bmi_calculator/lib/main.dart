import 'package:bmi_calculator/screen/displayresult.dart';
import 'package:bmi_calculator/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( 
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    )
      // Displayresult(weight: weight, height: height,  selectedgender: selectedGender, age: age, text: text,),
    // const Home()
    );
}

 