import 'package:bmi_calculator/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constraints.dart';

class Displayresult extends StatelessWidget {
  double? result;
  double? height;
  int? weight;
  int? age;
  String? selectedgender;
  String? text;
  Displayresult(
      {super.key,
      required this.height,
      required this.weight,
      this.age,
      this.result,
      required this.selectedgender,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {Navigator.pop(context);},
               icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            const Text(
              "Your Result",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, letterSpacing: 3.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kInactiveCardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "$text",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.greenAccent,
                            letterSpacing: 2.0),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        result!.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: kActiveCardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Gender".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                              Text("Height".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                              Text("Weight".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey)),
                              Text(
                                "Age".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                selectedGender,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                              Text(
                                height!.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                              Text(
                                weight.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              ),
                              Text(
                                age.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white70),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      // height: 200,
                      // width: double.infinity,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(10),
                      //   // border: Border.all(color: Colors.grey),
                      // ),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(10)),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "A BMI of "),
                                TextSpan(
                                    text: "18.5 - 24.9 ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text:
                                        " indicates that your weight is in the "),
                                TextSpan(
                                    text: "normal ",
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text:
                                        "category for a person of your height."),
                              ],
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              text:
                                  "Maintaining a healthy weight reduce the risk of diseases associated with overweight and obesity.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.refresh,
                size: 35,
              ),
              label: const Text(
                "Try Again",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                fixedSize: const Size(400, 50),
                backgroundColor: kBottomContainerColor,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
          ],
        ),
      ),
    );
  }
}
