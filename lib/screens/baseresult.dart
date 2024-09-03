import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfcalulator/data/create_excel_file/ecxel_sheet.dart';
import 'package:pfcalulator/data/create_excel_file/storage_methods.dart';
import 'package:pfcalulator/data/equations.dart';
import 'package:pfcalulator/screens/pf_before_after.dart';
import 'package:pfcalulator/screens/widgets/text_views.dart';
import 'package:pfcalulator/style/colors.dart';
import '../components/components.dart';

class BaseResult extends StatefulWidget {
  const BaseResult({
    Key? key,
    required this.SupplySystemvalueS,
    required this.SupplyVoltagevalue,
    required this.Efficiencyvalue,
    required this.SupplyFrequencyvalue,
    required this.InputPowervalue,
    required this.OldPowerFactorvalue,
    required this.DesirePowerFactorvalue,
    required this.DailyWorkingHoursvalue,
    required this.TarrifCharge_Kvavalue,
    required this.TarrifCharge_Kwvalue,
    required this.Capacitorvalue,
    required this.AnnualIntrestvalue,
    required this.unit,
    required this.DS,
  }) : super(key: key);
  final String? SupplySystemvalueS;
  final double SupplyVoltagevalue;
  final double Efficiencyvalue;
  final double SupplyFrequencyvalue;
  final double InputPowervalue;
  final double OldPowerFactorvalue;
  final double DesirePowerFactorvalue;
  final double DailyWorkingHoursvalue;
  final double TarrifCharge_Kvavalue;
  final double TarrifCharge_Kwvalue;
  final double Capacitorvalue;
  final double AnnualIntrestvalue;
  final String? DS;
  final String? unit;

  @override
  State<BaseResult> createState() => _BaseResultState();
}

class _BaseResultState extends State<BaseResult> {
  double cc = 0;
  double ic = 0;
  double aa = 0;
  double LeadingKVAR = 0;
  double LeadingKVARSupplied = 0;
  double tan1 = 0;
  double tan2 = 0;
  double StandartTable = 0;
  double CapacitanceofCapacitor = 0;
  double CurrentBeforepfcorrection = 0;
  double CurrentAfterpfcorrection = 0;
  int SupplySystemvalue = 0;
  final filename = TextEditingController();
  void initState() {
    SupplySystemvalue = int.parse(widget.SupplySystemvalueS!);
    cc = Equations().CC(widget.InputPowervalue, widget.Efficiencyvalue,
        widget!.unit, widget.OldPowerFactorvalue);
    tan1 = Equations().Tan1(widget.OldPowerFactorvalue);
    tan2 = Equations().Tan1(widget.DesirePowerFactorvalue);
    LeadingKVAR = Equations().LeadingKVAR(cc, tan1, tan2);
    StandartTable = Equations().StandartTable(LeadingKVAR);
    LeadingKVARSupplied = StandartTable / SupplySystemvalue;
    ic = Equations()
        .IC(LeadingKVAR, widget.SupplyVoltagevalue, SupplySystemvalue);
    aa = Equations().AA(widget.SupplyFrequencyvalue, widget.SupplyVoltagevalue);
    CapacitanceofCapacitor =
        (LeadingKVAR * 1000 / (aa * widget.SupplyVoltagevalue)) * 1000000;
    CurrentBeforepfcorrection = Equations().CurrentBeforepfcorrection(
        widget.OldPowerFactorvalue,
        widget.SupplyVoltagevalue,
        SupplySystemvalue,
        cc);
    CurrentAfterpfcorrection = Equations().CurrentAfterpfcorrection(
        widget.DesirePowerFactorvalue,
        widget.SupplyVoltagevalue,
        SupplySystemvalue,
        cc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(LeadingKVARSupplied);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              navigatepop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: red,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Result",
            style: TextStyle(color: red),
          ),
        ),
        body: Stack(
          children: [
            SvgPicture.asset("assets/images/splash/BackgroundLight.svg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppBar().preferredSize.height * 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResultView(
                          resText: "Total Reactive Power Required",
                          result: Equations().reduceDouble(LeadingKVAR),
                          unit: "kVAR",
                        ),
                        ResultView(
                          resText: "Total Capacitance Required",
                          result:
                              Equations().reduceDouble(CapacitanceofCapacitor),
                          unit: "µF",
                        ),
                        ResultView(
                          resText: "Capacitors Charging Current (Ic)",
                          result: Equations().reduceDouble(ic),
                          unit: "A",
                        ),
                        ResultView(
                          resText: "Current Before PF Correction",
                          result: Equations()
                              .reduceDouble(CurrentBeforepfcorrection),
                          unit: "A",
                        ),
                        ResultView(
                          resText: "Current After PF Correction	",
                          result: Equations()
                              .reduceDouble(CurrentAfterpfcorrection),
                          unit: "A",
                        ),

                        // Buttons
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                              height: 50,
                              minWidth: 150,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              color: red,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.read_more_sharp,
                                    size: 25,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Before & After PF Correction',
                                    style:
                                        TextStyle(fontSize: 15.0, color: white),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                navigateTo(
                                  context,
                                  PfBeforeAfter(
                                    DailyWhours: widget.DailyWorkingHoursvalue,
                                    LeadingKVAR: LeadingKVAR,
                                    CapacitorCost: widget.Capacitorvalue,
                                    StandartTable: StandartTable,
                                    InputPowervalue: widget.InputPowervalue,
                                    oldPowerFactorValue:
                                        widget.OldPowerFactorvalue,
                                    DesirePowerFactorvalue:
                                        widget.DesirePowerFactorvalue,
                                    TarrifCharge_Kvavalue:
                                        widget.TarrifCharge_Kvavalue,
                                    TarrifCharge_Kwvalue:
                                        widget.TarrifCharge_Kwvalue,
                                    AnnualIntrestvalue:
                                        widget.AnnualIntrestvalue,
                                    CurrentAfterpfcorrection:
                                        CurrentAfterpfcorrection,
                                    CurrentBeforepfcorrection:
                                        CurrentBeforepfcorrection,
                                    cc: cc,
                                    Ic: ic,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: red,
          onPressed: () {
            showDialog<String>(
              builder: (context) => AlertDialog(
                  contentPadding: const EdgeInsets.all(16.0),
                  content:   Row(
                    children: <Widget>[
                       Expanded(
                        child:  TextField(
                          controller: filename,
                          autofocus: true,
                          decoration:   InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: red),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: red),
                              ),
                              labelText: 'Excel File Name',
                              labelStyle:  TextStyle(fontWeight: FontWeight.bold,color:  red),
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color:  red),
                              hintText: '@Sheet Name'
                          ),
                        ),
                      )
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                        child:  Text('Cancel',style:TextStyle(fontWeight: FontWeight.bold,color:  red),),

                        onPressed: () {
                          filename.clear();

                          Navigator.pop(context);
                        }),
                     ElevatedButton(
                        child: Text('Save',style:TextStyle(fontWeight: FontWeight.bold,color:  red),),
                        onPressed: ()async {
                          setState(() {
                            createExcel(
                              filename.text.toString(),
                              widget.SupplySystemvalueS!,
                              widget.SupplyVoltagevalue,
                              widget.Efficiencyvalue,
                              widget.SupplyFrequencyvalue,
                              widget.InputPowervalue,
                              widget.OldPowerFactorvalue,
                              widget.DesirePowerFactorvalue,
                              widget.DailyWorkingHoursvalue,
                              widget.TarrifCharge_Kvavalue,
                              widget.TarrifCharge_Kwvalue,
                              widget.Capacitorvalue,
                              widget.AnnualIntrestvalue,
                              widget.DS!,
                              widget.unit!,
                            );


                          });
                          filename.clear();
                          Navigator.pop(context);
                        })
                  ],
                ), context: context,
              );


          },
          label: const Text(
            'Export Excel File',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: const Icon(Icons.download_for_offline,
              color: Colors.yellow, size: 25),
        ));
  }
}
