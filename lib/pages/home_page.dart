import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controllerTextFieldWeight =
      TextEditingController();

  final TextEditingController controllerTextFieldHeight =
      TextEditingController();

  String? bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).appBarTitle),
        actions: [
          IconButton(
            onPressed: clearAll,
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controllerTextFieldWeight,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => calculate(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: S.of(context).pageHomeWeigh,
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.amber.shade600,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.amber.shade600,
                    fontSize: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber.shade600,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber.shade600,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controllerTextFieldHeight,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => calculate(),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  labelText: S.of(context).pageHomeHeight,
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.amber.shade600,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.amber.shade600,
                    fontSize: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber.shade600,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber.shade600,
                      width: 2,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: calculate,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    backgroundColor: Colors.amber.shade600,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.delete_sweep,
                        size: 32,
                      ), // Replace with your desired icon
                      Text(
                        S.of(context).pageHomeCalculate,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ), // Replace with your desired text
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                bmiResult ?? "",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue.shade600,
                ),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void calculate() {
    double height = double.parse(controllerTextFieldHeight.text);
    double weight = double.parse(controllerTextFieldWeight.text);
    setState(() {
      bmiResult = calculateBMI(weight: weight, height: height);
    });
  }

  /// Calculate BMI
  String calculateBMI({required double weight, required double height}) {
    // Convert height from cm to meters
    double heightInMeters = height / 100;

    // Calculate BMI using the formula: weight / (height * height)
    double bmi = weight / pow(heightInMeters, 2);

    // Round the BMI to two decimal places
    bmi = double.parse(bmi.toStringAsFixed(2));

    String classification;
    if (bmi < 18.5) {
      classification = S.of(context).bmiResultUnder;
    } else if (bmi >= 18.5 && bmi < 25) {
      classification = S.of(context).bmiResultNormal;
    } else if (bmi >= 25 && bmi < 30) {
      classification = S.of(context).bmiResultOverWeight;
    } else {
      classification = S.of(context).bmiResultObesity;
    }
    return classification;
  }

  void clearAll() {
    controllerTextFieldHeight.clear();
    controllerTextFieldWeight.clear();
    setState(() {
      bmiResult = "";
    });
  }
}
