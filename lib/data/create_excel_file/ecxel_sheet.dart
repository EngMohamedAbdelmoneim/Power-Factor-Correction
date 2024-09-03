

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'storage_methods.dart';



Future<void> createExcel(
 String filename,
 String supplySystemValueS,
 double supplyVoltageValue,
 double efficiencyValue,
 double supplyFrequencyValue,
 double inputPowerValue,
 double oldPowerFactorValue,
 double desirePowerFactorValue,
 double dailyWorkingHoursValue,
 double tarrifChargeKvaValue,
 double tarrifChargeKwValue,
 double capacitorValue,
 double annualIntrestValue,
 String dS,
 String unit,

    ) async {
//Create an Excel document.

  //Creating a workbook.
  final Workbook workbook = Workbook();
  //Accessing via index
  final Worksheet sheet = workbook.worksheets[0];
  sheet.showGridlines = false;

  // Enable calculation for worksheet.
  sheet.enableSheetCalculations();

  //Set data in the worksheet.
  sheet.getRangeByName('C1').columnWidth = 50;
  sheet.getRangeByName('D1').columnWidth = 20;
  sheet.getRangeByName('E1').columnWidth = 20;
  sheet.getRangeByName('F1').columnWidth = 50;
  sheet.getRangeByName('G1').columnWidth = 20;
  sheet.getRangeByName('H1').columnWidth = 20;
  sheet.getRangeByName('I1').columnWidth = 50;
  sheet.getRangeByName('J1').columnWidth = 20;
  sheet.getRangeByName('K1').columnWidth = 20;
  sheet.getRangeByName('L1').columnWidth = 55;
  sheet.getRangeByName('M1').columnWidth = 20;
  sheet.getRangeByName('N1').columnWidth = 20;
  sheet.getRangeByName('C4:C21').rowHeight = 25;

  //HeadLine
  sheet.getRangeByName('C1:N3').cellStyle.backColor = '#E60909';
  sheet.getRangeByName('C1:N3').merge();
  sheet.getRangeByName('C1').setText('Power Factor Correction');
  sheet.getRangeByName('C1').cellStyle.fontSize = 24;
  sheet.getRangeByName('C1').cellStyle.bold;
  sheet.getRangeByName('C1').cellStyle.fontColor = '#FFFFFF';
  sheet.getRangeByName('C1').cellStyle.italic = true;
  sheet.getRangeByName('C1').cellStyle.fontName = 'Kodchasan';
 ////////////////////////////////////////////////////////////////


////////////////Head Lines/////////////////////////////////////////
  final Range range1 = sheet.getRangeByName('C4:C5');
  final Range range2 = sheet.getRangeByName('D4:D5');
  final Range range3 = sheet.getRangeByName('E4:E5');
  final Range range4 = sheet.getRangeByName('F4:F5');
  final Range range5 = sheet.getRangeByName('G4:G5');
  final Range range6 = sheet.getRangeByName('H4:H5');
  final Range range7 = sheet.getRangeByName('I4:I5');
  final Range range8 = sheet.getRangeByName('J4:J5');
  final Range range9 = sheet.getRangeByName('K4:K5');



  final Range range13 = sheet.getRangeByName('L4:L5');
  final Range range14 = sheet.getRangeByName('M4:M5');
  final Range range15 = sheet.getRangeByName('N4:N5');
  final Range range16= sheet.getRangeByName('F16:H17');

  range1.merge();
  range2.merge();
  range3.merge();
  range4.merge();
  range5.merge();
  range6.merge();
  range7.merge();
  range8.merge();
  range9.merge();

  range13.merge();
  range14.merge();
  range15.merge();
  range16.merge();

void excelElement( Range range, String text,String backColor,String fontColor,double textSize,HAlignType alignH,VAlignType alignV){
  range.setText(text);
  range.cellStyle.backColor = backColor;
  range.cellStyle.fontColor =  fontColor;
  range.cellStyle.fontName = 'Aptos Narrow';
  range.cellStyle.fontSize = textSize;
  range.cellStyle.bold = true;
  range.cellStyle.hAlign = alignH;
  range.cellStyle.vAlign = alignV;
  range.cellStyle.borders.top.lineStyle = LineStyle.thin;
  range.cellStyle.borders.right.lineStyle = LineStyle.thin;
  range.cellStyle.borders.top.color = "#FFFFFF";
  range.cellStyle.borders.right.color = "#FFFFFF";
}
void excelValuesElement( Range range,String? formula, double value,String backColor,String fontColor,double textSize,HAlignType alignH,VAlignType alignV){
    range.setNumber(value);
    range.formula = formula;
    range.cellStyle.backColor = backColor;
    range.cellStyle.fontColor =  fontColor;
    range.cellStyle.fontName = 'Aptos Narrow';
    range.cellStyle.fontSize = textSize;
    range.cellStyle.bold = true;
    range.cellStyle.hAlign = alignH;
    range.cellStyle.vAlign = alignV;
    range.cellStyle.borders.top.lineStyle = LineStyle.thin;
    range.cellStyle.borders.right.lineStyle = LineStyle.thin;
    range.cellStyle.borders.right.color = "#FFFFFF";

    range.cellStyle.borders.top.color = "#FFFFFF";
  }
void dropDownMenu(String cell,List<String> list,String value,String backColor,String fontColor,double textSize,){
  sheet.getRangeByName(cell).setValue(value);
  sheet.getRangeByName(cell).cellStyle.borders.top.lineStyle =
      LineStyle.medium;
  sheet.getRangeByName(cell).cellStyle.backColor = backColor;
  sheet.getRangeByName(cell).cellStyle.fontColor =  fontColor;
  sheet.getRangeByName(cell).cellStyle.fontName = 'Aptos Narrow';
  sheet.getRangeByName(cell).cellStyle.fontSize = textSize;
  sheet.getRangeByName(cell).cellStyle.bold = true;
  sheet.getRangeByName(cell).cellStyle.hAlign = HAlignType.center;
  sheet.getRangeByName(cell).cellStyle.vAlign = VAlignType.center;
  sheet.getRangeByName(cell).cellStyle.borders.top.lineStyle = LineStyle.thin;
  sheet.getRangeByName(cell).cellStyle.borders.right.lineStyle = LineStyle.thin;
  sheet.getRangeByName(cell).cellStyle.borders.top.color = "#FFFFFF";
  sheet.getRangeByName(cell).cellStyle.borders.right.color = "#FFFFFF";

  final DataValidation listValidation =
      sheet.getRangeByName(cell).dataValidation;
  listValidation.allowType = ExcelDataValidationType.integer;
  listValidation.listOfValues = list;
  listValidation.promptBoxText = 'Data Validation list';
  listValidation.showPromptBox = true;
  listValidation.showErrorBox = true;
  listValidation.errorBoxText = 'Select an item only from the list';
  listValidation.errorBoxTitle = 'Error';
  }
void dropDownMenuINt(String cell,List<String> list,double value,String backColor,String fontColor,double textSize,){
    sheet.getRangeByName(cell).setNumber(value);
    sheet.getRangeByName(cell).cellStyle.borders.top.lineStyle =
        LineStyle.medium;
    sheet.getRangeByName(cell).cellStyle.backColor = backColor;
    sheet.getRangeByName(cell).cellStyle.fontColor =  fontColor;
    sheet.getRangeByName(cell).cellStyle.fontName = 'Aptos Narrow';
    sheet.getRangeByName(cell).cellStyle.fontSize = textSize;
    sheet.getRangeByName(cell).cellStyle.bold = true;
    sheet.getRangeByName(cell).cellStyle.hAlign = HAlignType.center;
    sheet.getRangeByName(cell).cellStyle.vAlign = VAlignType.center;
    sheet.getRangeByName(cell).cellStyle.borders.top.lineStyle = LineStyle.thin;
    sheet.getRangeByName(cell).cellStyle.borders.right.lineStyle = LineStyle.thin;
    sheet.getRangeByName(cell).cellStyle.borders.top.color = "#FFFFFF";
    sheet.getRangeByName(cell).cellStyle.borders.right.color = "#FFFFFF";
    final DataValidation listValidation =
        sheet.getRangeByName(cell).dataValidation;
    listValidation.allowType = ExcelDataValidationType.integer;
    listValidation.listOfValues = list;
    listValidation.promptBoxText = 'Data Validation list';
    listValidation.showPromptBox = true;
    listValidation.showErrorBox = true;
    listValidation.errorBoxText = 'Select an item only from the list';
    listValidation.errorBoxTitle = 'Error';
  }

  excelElement(range1,'Input Data',"#E60909", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range2,'Values',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range3,'Units',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range4,'Basic Results',"#E60909", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range5,'Values',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range6,'Units',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range7,'Before PF Correction',"#E60909", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range8,'Values',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range9,'Units',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  // excelElement(range10,'After P.F Correction',"#E60909", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  // excelElement(range11,'Values',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  // excelElement(range12,'Units',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range13,'After PF Correction',"#E60909", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range14,'Values',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range15,'Units',"#9E0606", "#FFFFFF",24,HAlignType.center,VAlignType.center);
  excelElement(range16,'Benefits of PF Correction',"#70AD47", "#000000",24,HAlignType.center,VAlignType.center);

///////////////////////////////////////////////////////////////////////////////

////////////////formulas/////////////////////formulas////////////////////////////
  String currentBeforePFC = r'=IF(D6 = 3,(E26*1000)/(1.732050808* D7 * D12),(E26* 1000)/(D7 * D12))';
  String leadingKVAR = r'=E26*(TAN(ACOS(D12))-TAN(ACOS(D13)))';
  String leadingPhase = r'=G6/D6';
  String capacitanceOfCapacitor = r'=G6*1000/(E27*D7)*1000000';
  String currentAfterBFC = r'=IF(D6 = 3,(E26*1000)/(1.732050808* D7 * D13),(E26* 1000)/(D7 * D13))';
  String maxDemandBefore = r'=E26/D12';
  String maxDemandAfter = r'=E26/D13';
  String realMaxDemandBefore = r'=((IF(E9="Kw",(D9*(D10/100)),IF(E9="HP",(D9*0.746*(D10/100)),(D9*D12*(D10/100)))))/D12)';
  String realMaxDemandAfter = r'=((IF(E9="Kw",(D9*(D10/100)),IF(E9="HP",(D9*0.746*(D10/100)),(D9*D12*(D10/100)))))/D13)';
  String ic = r'=IF(D6 = 3,(G6 *1000)/ (D7*1.732050808),(G6*1000)/(D7))';
  String c = r'=IF(E9="kW",D9/(D10/100),IF(E9="HP",D9*0.7457/(D10/100),D9*D12/(D10/100)))';
  String aa = r'=2*PI()*D8*D7';
  ///////////////////////////////////////////////////////////////////////////////////////

  ////////////// Input Data Element and Values and Units //////////////////////////////////
  excelElement(sheet.getRangeByName('C6'),'Supply System',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C7'),'Supply Voltage',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C8'),'Supply Frequency',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C9'),'Output Power',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C10'),'Efficiency',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C11'),'Current Before PF Correction',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C12'),'Existing Power Factor',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C13'),'Desired Power Factor',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C14'),'Capacitor Connection',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C15'),'Daily Working Hours',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C16'),'Max Demand Cost(EGP/kW.month)',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C17'),'Energy Cost(EGP/kWh',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C18'),'Capacitor Cost (EGP/kVAr)',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('C19'),'Annual Int & Dep',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);

  dropDownMenuINt('D6',['1','3'],double.parse(supplySystemValueS),"#FFC7CE", "#9C0006",16,);
  excelValuesElement(sheet.getRangeByName('D7'),null,supplyVoltageValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D8'),null,supplyFrequencyValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D9'),null,inputPowerValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D10'),null,efficiencyValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D11'),currentBeforePFC,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D12'),null,oldPowerFactorValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D13'),null,desirePowerFactorValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  dropDownMenu('D14',<String>['Star','Delta'],dS,"#FFC7CE", "#9C0006",16,);
  excelValuesElement(sheet.getRangeByName('D15'),null,dailyWorkingHoursValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D16'),null,tarrifChargeKvaValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D17'),null,tarrifChargeKwValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D18'),null,capacitorValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('D19'),null,annualIntrestValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);



  excelElement(sheet.getRangeByName('E6'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E7'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E8'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  dropDownMenu('E9',<String>['kw','HP','kVA'],unit,"#FFC7CE", "#9C0006",16,);
  excelElement(sheet.getRangeByName('E10'),'%',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E11'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E12'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E13'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E14'),' ',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E15'),'Hr',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E16'),'EGP/kW.month',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E17'),'EGP/kWh',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E18'),'EGP/kVAR',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('E19'),'%',"#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  ////////////////////////////////////////////cc IC/////////////////////////////////////////////////////
  excelValuesElement(sheet.getRangeByName('E26'),c,capacitorValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('E27'),aa,annualIntrestValue,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);


  excelElement(sheet.getRangeByName('D26'),"cc","#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('D27'),"aa","#FFC7CE", "#9C0006",16,HAlignType.center,VAlignType.center);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////////Basic Result//////////////////////////////////////////////////////////////
  excelElement(sheet.getRangeByName('F6'),'Total Reactive Power Required ',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F7'),'Leading kVAR supplied by each Phase',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F8'),'Total Capacitance Required',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F9'),'Required Capacitor is',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F10'),'Current After PF Correction',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);

  excelElement(sheet.getRangeByName('F11'),'Capacitors Charging Current (Ic)',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F12'),'Annual Cost before PF Correction: ',"#FFC000", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F13'),'Max Demand Before',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F14'),'Annual Cost After PF Correction: ',"#FFC000", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F15'),'Max Demand After',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);


  //////// Values /////////////
  excelValuesElement(sheet.getRangeByName('G6'),leadingKVAR,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G7'),leadingPhase,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G8'),capacitanceOfCapacitor,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G9'),r'=D6&" No of"',0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G10'),currentAfterBFC,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G11'),ic,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G12'),"=J12",0,"#FFC000", "#000000",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G13'),realMaxDemandBefore,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G14'),"=M12",0,"#FFC000", "#000000",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G15'),realMaxDemandAfter,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);

  //////// Units///////////
  excelElement(sheet.getRangeByName('H6'),'kVAR',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H7'),'kVAR/Phase',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H8'),'μF',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('H9'),r'=ROUND(G6,2)&" kVAR"',0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H10'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H11'),' ',"#C00000", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H12'),'EGP',"#FFC000", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H13'),''
      '',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H14'),'EGP',"#FFC000", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H15'),'kVA',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////  Before P F Correction ////////////////////////////////////
                                 ///////// Head Lines ////////
  excelElement(sheet.getRangeByName('I6'),'Max Demand',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I7'),'Losses',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I8'),'Max Demand Fixed Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I9'),'Annual Energy Consumption',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I10'),'Consumed Energy Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I11'),'Penalty / Bonus',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('I12'),'Total Annual Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  ///////// Values ////////
  excelValuesElement(sheet.getRangeByName('J6'),maxDemandBefore,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J7'),"POWER(D11,2)",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J8'),"=IF(E26>500,(E26*D16*12),0)",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J9'),"=E26*D15* 365",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J10'),"=J9*D17",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J11'),'=IF(D12>=0.95,-0.015*J10, IF(D12>=0.92,-0.005*(D12-0.92)*100*J10, IF(D12>=0.72,0.005*(0.92-D12)*100*J10,0.01*(0.72-D12)*100*J10)))',0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('J12'),'=J8+J10+J11',0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  ///////// Units ////////
  excelElement(sheet.getRangeByName('K6'),'kVA',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K7'),'W',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K9'),'kWh',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K8'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K10'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K11'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('K12'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////  After P F Correction ////////////////////////////////////
                                    ///////// Head Lines ////////
  excelElement(sheet.getRangeByName('L6'),'Max Demand',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L7'),'Losses',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L8'),'Max Demand Fixed Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L9'),'Annual Energy Consumption',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L10'),'Consumed Energy Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L11'),'Penalty / Bonus',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L12'),'Total Annual Cost',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L13'),'Capital Cost of Capacitors',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('L14'),'Annual Int. and Dep.',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
  ///////// Values ////////
  excelValuesElement(sheet.getRangeByName('M6'),maxDemandAfter,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M7'),"=G10^2",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M8'),"=IF(E26>500,(E26*D16*12),0)",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M9'),"=E26*D15* 365",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M10'),"=M9*D17",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M11'),"=IF(D13>=0.95,-0.015*M10, IF(D13>=0.92,-0.005*(D13-0.92)*100* M10, IF(D13>=0.72,0.005*(0.92-D13)*100* M10,0.01*(0.72-D13)*100*M10)))",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M12'),"=M8+M10+M11+M14",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M13'),"=G6*D18",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('M14'),"=(D19/100)*M13",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);

  ///////// Units ////////
  excelElement(sheet.getRangeByName('N6'),'kVA',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N7'),'W',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N9'),'kWh',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N8'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N10'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N11'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N12'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N13'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('N14'),'EGP',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////  Protection of Capacitor Bank ////////////////////////////////////
                                           ///////// Head Lines ////////
//   excelElement(sheet.getRangeByName('L6'),'Capacitor Charging Current (Ic)',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L7'),'Capacitance of the capacitor(c)',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L8'),'First Value Size of main fuse',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L9'),'Second Value Size of main fuse',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L10'),'Size of Circuit Breaker',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L11'),'Thermal Setting of Circuit Breaker',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L12'),'Magnetic Setting of Circuit Breaker',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//   excelElement(sheet.getRangeByName('L13'),'Size of Cable For Capacitor Connection',"#D9D9D9", "#000000",16,HAlignType.left,VAlignType.center);
//
//   ///////// Values ////////
//     excelValuesElement(sheet.getRangeByName('M6'),ic,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M7'),c,0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M8'),"=1.65*M6",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M9'),"=2*M6",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M10'),"=1.5*M6",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M11'),"=1.5*M6",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M12'),"=10*M6",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelValuesElement(sheet.getRangeByName('M13'),"=IF(G6<=100*10^3,(M6*1.43),((M6*1.365)))",0,"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//
//   ///////// Units ////////
//   excelElement(sheet.getRangeByName('N6'),'Amp',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N7'),'',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N8'),'',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N9'),'',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N10'),'',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N11'),'Amp',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N12'),'Amp',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
//   excelElement(sheet.getRangeByName('N13'),'Amp',"#E60909", "#FFFFFF",16,HAlignType.center,VAlignType.center);
// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////  Benefits if P.F Correction ////////////////////////////////////
                                          ///////// Head Lines ////////
  excelElement(sheet.getRangeByName('F18'),'The losses in cable are reduced to',"#C6E0B4", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F19'),'Annual Savings',"#A9D08E", "#000000",16,HAlignType.left,VAlignType.center);
  excelElement(sheet.getRangeByName('F20'),'Payback Period in',"#89BF65", "#000000",16,HAlignType.left,VAlignType.center);

                                            ///////// Values ////////
  excelValuesElement(sheet.getRangeByName('G18'),"=(M7/J7)*100",0,"#C6E0B4", "#000000",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G19'),"=G12-G14",0,"#A9D08E", "#000000",16,HAlignType.center,VAlignType.center);
  excelValuesElement(sheet.getRangeByName('G20'),"=ROUND(((M13/G19)*365),0)",0,"#89BF65", "#000000",16,HAlignType.center,VAlignType.center);

  ///////// Units ////////
  excelElement(sheet.getRangeByName('H18'),'%',"#C6E0B4", "#000000",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H19'),'EGP',"#A9D08E", "#000000",16,HAlignType.center,VAlignType.center);
  excelElement(sheet.getRangeByName('H20'),'Days',"#89BF65", "#000000",16,HAlignType.center,VAlignType.center);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //Save and launch the excel.
  final List<int> bytes = workbook.saveAsStream();
  //Dispose the document.
  workbook.dispose();
  //Save and launch file.
  FileStorage.writeCounter(
      bytes, "$filename.xlsx");
}