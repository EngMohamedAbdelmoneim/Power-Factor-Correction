import 'dart:math';

class EquationsOld {
  double? ic;
  double? standartTable;
  double? cc;
  double? aa;
  double? tan1;
  double? tan2;
  double? CurrentBeforeCfCorrection;
  double? CurrentAfterCfCorrection;
  String? CurrentBeforeCfCorrectionError;
  double? leadingKVAR;
  double? leadingKVARsupplied;

  static const double pi = 3.14159265359;
  static double const1 = sqrt(3);

  double StandartTable(double leadingKVAR ) {
  int leadingKVARINT = leadingKVAR.toInt();
  print(leadingKVARINT);
  int leadingKVARINTTenth = (leadingKVARINT % 100) ~/ 1;
  print(leadingKVARINTTenth);
    if (leadingKVARINTTenth < 50) {
      standartTable = (((leadingKVAR/100.0).round() * 100)+50);
    }
    else {
      standartTable = (leadingKVAR/100.0).round() * 100 ;
    }
    return standartTable!;
  }


    ///////////////////////////////////////
    CC(double InputPower , double Efficiency , String? unit , double OldPowerFactor){
      if(unit == "kW") {
        cc = InputPower * (Efficiency / 100);
      }
      else if(unit == "HP"){
        cc = (InputPower * 0.746) * (Efficiency / 100);
      }
      else{
        cc = (InputPower * OldPowerFactor) * (Efficiency / 100);
      }
      return cc;
    }

    //////////////////////////////////////
  IC(double Leading_KVAR_Supplied, double SupplyVoltage, String deltaStar){

      if(deltaStar == "Delta") {
        ic = (Leading_KVAR_Supplied * 1000) / SupplyVoltage;
      }
      else{
        ic = (Leading_KVAR_Supplied*1000) / (SupplyVoltage/const1);
      }
      return ic!;
    }
  AA(double SupplyFrequency, double SupplyVoltage, String deltaStar){

    if(deltaStar == "Delta") {
      aa = (2 * pi) * SupplyVoltage * SupplyFrequency;
    }
    else{
      aa = (2 * pi) * SupplyVoltage * (SupplyFrequency/const1);
    }
    return aa!;
  }
//////////////////////////////////////////
     double Tan1(double oldPowerFactor) {
      tan1 = tan(acos(oldPowerFactor));
      return tan1!;
    }
    double Tan2(double desirePowerFactor) {
      tan2 = tan(acos(desirePowerFactor));
      return tan2!;

    }
    //////////////////////////////////
  SizeofCable(double LeadingKvar, double ic){
    double SizeofCable;
    if(LeadingKvar <= (100*pow(10, 3))) {
      SizeofCable = ic * 1.43;
    }
    else{
      SizeofCable = ic * 1.365;
    }
    return SizeofCable;
  }

////////////////////////////////////////
  double LeadingKVAR(double cc, double tan1 , double tan2) {
     leadingKVAR =(  cc * (tan1 - tan2));
     return leadingKVAR!;
}

  double? LeadingKVARsupplied(double SupplySystem) {
    leadingKVARsupplied = standartTable! / SupplySystem;
    return leadingKVARsupplied;
}
   CurrentBeforepfcorrection(double OldPowerFactor, double SupplyVoltage, double SupplySystem, double cc){

    if(SupplySystem == 3) {
      CurrentBeforeCfCorrection = ( cc *1000)/(1.732050808* SupplyVoltage * OldPowerFactor);
    }
    else{
      CurrentBeforeCfCorrection = ( cc *1000)/(1* SupplyVoltage * OldPowerFactor);
    }
    return CurrentBeforeCfCorrection;
  }
  CurrentAfterpfcorrection(double DesirePowerFactor, double SupplyVoltage, double SupplySystem, double cc){

    if(SupplySystem == 3) {
      CurrentAfterCfCorrection = ( cc *1000)/(1.732050808* SupplyVoltage * DesirePowerFactor);
    }
    else{
      CurrentAfterCfCorrection = ( cc *1000)/(1* SupplyVoltage * DesirePowerFactor);
    }
    return CurrentAfterCfCorrection;
  }
  double reduceDouble(double num){
    String snumInt = num.toInt().toString();

    int len = (snumInt.length);


    String snumreal = num.toStringAsExponential(len+2);
    num = double.parse(snumreal);
    return num;
  }


  int calculateNumber(int number) {
    int a = number % 100;

    if (a > 0) {
      return (number ~/ 100) * 100 + 100;
    }

    return number;
  }


}


class Equations {
  double? ic;
  double? standartTable;
  double? cc;
  double? aa;
  double? tan1;
  double? tan2;
  double? CurrentBeforeCfCorrection;
  double? CurrentAfterCfCorrection;
  String? CurrentBeforeCfCorrectionError;
  double? leadingKVAR;
  double? leadingKVARsupplied;

  static const double pi = 3.14159265359;
  static double const1 = sqrt(3);

  double StandartTable(double leadingKVAR ) {
    int leadingKVARINT = leadingKVAR.toInt();
    print(leadingKVARINT);
    int leadingKVARINTTenth = (leadingKVARINT % 100) ~/ 1;
    print(leadingKVARINTTenth);
    if (leadingKVARINTTenth < 50) {
      standartTable = (((leadingKVAR/100.0).round() * 100)+50);
    }
    else {
      standartTable = (leadingKVAR/100.0).round() * 100 ;
    }
    return standartTable!;
  }


  ///////////////////////////////////////
  double CC(double InputPower , double Efficiency , String? unit , double OldPowerFactor){
    if(unit == "kW") {
      return InputPower / (Efficiency / 100);
    }
    else if(unit == "HP"){
      return (InputPower * 0.7457) / (Efficiency / 100);
    }
    return (InputPower * OldPowerFactor) / (Efficiency / 100);

  }

  //-----------------------new---------------------------
  double IC(double Leading_KVAR, double SupplyVoltage, int SupplySystem){

    if(SupplySystem == 3) {
      return (Leading_KVAR *1000)/ (SupplyVoltage*1.732050808);
    }
    return (Leading_KVAR * 1000)/ (SupplyVoltage);
  }

  //-----------------------new---------------------------
  double AA(double SupplyFrequency, double SupplyVoltage){

    return (2 * pi) * SupplyVoltage * SupplyFrequency;

  }
  // new --------------------------- new
  CapacitanceofCapacitor(double Leading_KVAR_Supplied,double SupplyVoltage,double aa)
  {
    return (Leading_KVAR_Supplied*1000/(aa*SupplyVoltage))*1000000;

  }
//////////////////////////////////////////
  double Tan1(double oldPowerFactor) {
    tan1 = tan(acos(oldPowerFactor));
    return tan1!;
  }
  double Tan2(double desirePowerFactor) {
    tan2 = tan(acos(desirePowerFactor));
    return tan2!;

  }
  //////////////////////////////////
  SizeofCable(double LeadingKvar, double ic){
    double SizeofCable;
    if(LeadingKvar <= (100*pow(10, 3))) {
      SizeofCable = ic * 1.43;
    }
    else{
      SizeofCable = ic * 1.365;
    }
    return SizeofCable;
  }

////////////////////////////////////////
  double LeadingKVAR(double cc, double tan1 , double tan2) {
    leadingKVAR =(  cc * (tan1 - tan2));
    return leadingKVAR!;
  }

  double? LeadingKVARsupplied(double SupplySystem) {
    leadingKVARsupplied = standartTable! / SupplySystem;
    return leadingKVARsupplied;
  }

  //---------------------- new -----------------------===
  double CurrentBeforepfcorrection(double OldPowerFactor, double SupplyVoltage, int SupplySystem, double cc){

    if(SupplySystem == 3) {
      return (cc * 1000)/(1.732050808* SupplyVoltage * OldPowerFactor);
    }
    return (cc * 1000)/(SupplyVoltage * OldPowerFactor);
  }

  //---------------------- new -----------------------===
  double CurrentAfterpfcorrection(double DesirePowerFactor, double SupplyVoltage, int SupplySystem, double cc){

    if(SupplySystem == 3) {
       return  (cc * 1000)/(1.732050808 * SupplyVoltage *DesirePowerFactor);
    }
      return (cc * 1000)/(SupplyVoltage * DesirePowerFactor);

  }
  double reduceDouble(double num){
    String snumInt = num.toInt().toString();

    int len = (snumInt.length);


    String snumreal = num.toStringAsExponential(len+2);
    num = double.parse(snumreal);
    return num;
  }


  int calculateNumber(int number) {
    int a = number % 100;

    if (a > 0) {
      return (number ~/ 100) * 100 + 100;
    }

    return number;
  }

  //----------------------------- new -----------------------
  double Penalty(double oldPouerFactor, double energyCharge_year){
     if(oldPouerFactor>=0.95){
       return -0.015*energyCharge_year;
     }
     else if (oldPouerFactor>=0.92){
       return -0.005*(oldPouerFactor-0.92)*100*energyCharge_year;
     }
     else if(oldPouerFactor>=0.72){
      return 0.005*(0.92-oldPouerFactor)*100* energyCharge_year;
     }
     else{
       return 0.01*(0.72-oldPouerFactor)*100* energyCharge_year;
     }

  }
  double Bonus(double desiredPouerFactor, double energyCharge_year){
    if(desiredPouerFactor>=0.95){
      return -0.015*energyCharge_year;
    }
    else if (desiredPouerFactor>=0.92){
      return -0.005*(desiredPouerFactor-0.92)*100*energyCharge_year;
    }
    else if(desiredPouerFactor>=0.72){
      return 0.005*(0.92-desiredPouerFactor)*100* energyCharge_year;
    }
    else{
      return 0.01*(0.72-desiredPouerFactor)*100* energyCharge_year;
    }

  }


}