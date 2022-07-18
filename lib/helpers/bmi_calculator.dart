import '../constants/constant.dart';

class BmiCalculator{
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDesc;

  BmiCalculator({required this.height,required this.weight});
  BmiCalculator.fromBmiValue(this.bmi){
    // this.bmi = bmi;
  }

  double calculateBmi(){
    double heightInMeter = height! / 100;


    final heightx2 = (heightInMeter * heightInMeter);
    bmi = weight! / heightx2;

    return bmi!;
  }

  String determineBmiCategory(){
    String category = "";
    if (bmi! < 16.0){
        category = underweightSevere;
    } else if (bmi! < 17.0){
        category = underweightModerate;
    } else if (bmi! < 18.5){
        category = underweightMild;
    } else if (bmi! < 25.0){
        category = normal;
    } else if (bmi! < 30.0){
        category = overweight;
    } else if (bmi! < 35.0){
        category = obeseI;
    } else if (bmi! < 40.0){
        category = obeseII;
    } else if (bmi! >= 40){
      category = obeseIII;
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealthRiskDescription(){
    String desc = "";
    switch (bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "low risk (healty Range)";
        break;  
      case overweight:
        desc = "Moderate risk of developing heart disease , high blood presure";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "High risk of developing heart disease , high blood presure";
        break;
        
      default:
    }
    bmiDesc = desc;
    return bmiDesc!;
  }
}