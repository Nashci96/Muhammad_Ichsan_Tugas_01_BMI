import 'package:flutter/material.dart';
import 'package:flutter_application_bootcamp_01/helpers/bmi_calculator.dart';
import 'package:flutter_application_bootcamp_01/views/bmi_data_screen.dart';


class BmirResultScreen extends StatelessWidget {
  const BmirResultScreen({
    Key? key,
    required this.bmi, 
    // required this.bmiCalculator
    }) : super(key: key);
  final double bmi;
  
  // final BmiCalculator? bmiCalculator;

  // String determineBmiCategory(double bmiValue){
  //   String category = "";
  //   if (bmiValue < 16.0){
  //       category = underweightSevere;
  //   } else if (bmiValue<17.0){
  //       category = underweightModerate;
  //   } else if (bmiValue<18.5){
  //       category = underweightMild;
  //   } else if (bmiValue<25.0){
  //       category = normal;
  //   } else if (bmiValue<30.0){
  //       category = overweight;
  //   } else if (bmiValue<35.0){
  //       category = obeseI;
  //   } else if (bmiValue<40.0){
  //       category = obeseII;
  //   } else if (bmiValue > 40){
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealthRiskDescription(String categoryName){
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis";
  //       break;
  //     case normal:
  //       desc = "low risk (healty Range)";
  //       break;  
  //     case overweight:
  //       desc = "Moderate risk of developing heart disease , high blood presure";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc = "High risk of developing heart disease , high blood presure";
  //       break;
        
  //     default:
  //   }
  //   return desc;

  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory = 
    bmiCalculator.determineBmiCategory();
    // final bmiDesc = 
    bmiCalculator.getHealthRiskDescription();


    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
        ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Hasil Perhitungan",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal:15.0,
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCalculator.bmiCategory!,
                      style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                      ),
                    Text(
                      bmiCalculator.bmiDesc!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 80,
                color: const Color(0xffec3c66),
                child: const Center(
                  child: Text(
                    "Calculate Your BMI again",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),)),
              ),
            )
        ],
        ),
    );
    
  }
}