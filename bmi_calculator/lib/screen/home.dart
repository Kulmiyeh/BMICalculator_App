import 'dart:math';

import 'package:bmi_calculator/Widgets/carddesign.dart';
import 'package:bmi_calculator/screen/displayresult.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constraints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int weight = 50;
int age = 24;
double height = 180;
String text = "Overweight";
enum Gender { male, female }

Gender selectedgender = Gender.male;
String selectedGender = "Male";

class _HomeState extends State<Home> {
  // ignore: non_constant_identifier_names
  void GoScreen() {
    double result = weight / pow(height / 100, 2);
    if(result < 18.5){
      text = "Underweight";
    }
    else if(result > 18.5 && result < 24.9){
      text = "Normal weight";
    }
    else if(result > 25 && result < 29.9){
      text = "Overweight";
    }
    else if (result >= 30){
      text = "Obesity";
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Displayresult(
                  age: age,
                  selectedgender: selectedGender,
                  height: height,
                  weight: weight,
                  result: result,
                  text: text,
                
                )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(letterSpacing: 3.0),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Carddesign(
                      selected: selectedgender == Gender.male ? true : false,
                      onPressed: () {
                        selectedgender = Gender.male;
                        selectedGender = "Male";
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.mars,
                            color: Colors.white,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Male".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey, letterSpacing: 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Carddesign(
                      selected: selectedgender == Gender.female ? true : false,
                      onPressed: () {
                        selectedgender = Gender.female;
                        selectedGender = "Female";
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.venus,
                            color: Colors.white,
                            size: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Female".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey, letterSpacing: 2.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Carddesign(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Height".toUpperCase(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey, letterSpacing: 2.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.round().toString(),
                          style: const TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                          activeTrackColor: kBottomContainerColor,
                          thumbColor: kBottomContainerColor,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          )),
                      child: Slider(
                        value: height,
                        onChanged: (newvalue) {
                          setState(() {
                            height = newvalue;
                          });
                        },
                        max: 300,
                        min: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Carddesign(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey, letterSpacing: 2.0),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$weight",
                                style: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "kg",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  if (weight > 0) weight--;
                                  setState(() {});
                                },
                                fillColor: Colors.grey[600],
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 50,
                                  width: 50,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                fillColor: Colors.grey[600],
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 50,
                                  width: 50,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Carddesign(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey, letterSpacing: 2.0),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$age",
                                style: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                "yrs",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                },
                                fillColor: Colors.grey[600],
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 50,
                                  width: 50,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                fillColor: Colors.grey[600],
                                shape: const CircleBorder(),
                                constraints: const BoxConstraints.tightFor(
                                  height: 50,
                                  width: 50,
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            RawMaterialButton(
              onPressed: () =>
                GoScreen(),
                
              fillColor: kBottomContainerColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              constraints:
                  const BoxConstraints.tightFor(height: 50, width: 400),
              child: const Text(
                "Calculate BMI",
                style: TextStyle(fontSize: 25, color: Colors.white,letterSpacing: 2.0),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20))

            // ElevatedButton(
            //   onPressed: () {
            //     _GoScreen();
            //   },
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25)),
            //     fixedSize: const Size(400, 50),
            //     backgroundColor: kBottomContainerColor,
            //   ),
            //   child:  Text(
            //     "Calculate".toUpperCase(),
            //     style: const TextStyle(
            //       fontSize: 25,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
