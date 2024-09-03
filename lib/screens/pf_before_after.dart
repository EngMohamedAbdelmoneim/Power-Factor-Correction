import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfcalulator/components/components.dart';
import 'package:pfcalulator/screens/widgets/text_views.dart';
import 'package:pfcalulator/style/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../data/equations.dart';

class PfBeforeAfter extends StatefulWidget {
  const PfBeforeAfter({
    Key? key,
    required this.DailyWhours,
    required this.LeadingKVAR,
    required this.CapacitorCost,
    required this.StandartTable,
    required this.InputPowervalue,
    required this.oldPowerFactorValue,
    required this.DesirePowerFactorvalue,
    required this.TarrifCharge_Kvavalue,
    required this.TarrifCharge_Kwvalue,
    required this.AnnualIntrestvalue,
    required this.CurrentAfterpfcorrection,
    required this.CurrentBeforepfcorrection,
    required this.cc,
    required this.Ic,
  }) : super(key: key);
  final double LeadingKVAR;
  final double Ic;
  final double DailyWhours;
  final double CapacitorCost;
  final double StandartTable;
  final double cc;
  final double CurrentBeforepfcorrection;
  final double CurrentAfterpfcorrection;
  final double InputPowervalue;
  final double oldPowerFactorValue;
  final double DesirePowerFactorvalue;
  final double TarrifCharge_Kvavalue;
  final double TarrifCharge_Kwvalue;
  final double AnnualIntrestvalue;

  @override
  State<PfBeforeAfter> createState() => _PfBeforeAfterState();
}

class _PfBeforeAfterState extends State<PfBeforeAfter> {
  double ActualMaxDemand_B = 0;
  int MaxDemand_B = 0;
  double KVADemandCharge_B = 0;
  double unitConsumed_B = 0;
  double EnergyCharge_B = 0;
  double TotalAnnualCost_B = 0;

  double ActualMaxDemand_A = 0;
  int MaxDemand_A = 0;
  double KVADemandCharge_A = 0;
  double unitConsumed_A = 0;
  double EnergyCharge_A = 0;
  double TotalAnnualCost_A = 0;
  double AnnualInteandDep = 0;
  double Capitalcost = 0;

  // Benefits After add Pf correction
  double ReductionOfLosses = 0;
  double AnnualSaving = 0;
  double PayBackPeriod = 0;


  //Penalty and bonus
  double Penalty_Bonus_B = 0;
  double Penalty_Bonus_A = 0;

  @override
  void initState() {
    ActualMaxDemand_B = widget.cc / widget.oldPowerFactorValue;
    MaxDemand_B = Equations()
        .calculateNumber(Equations().reduceDouble(ActualMaxDemand_B).round());
    KVADemandCharge_B = widget.cc > 500 ? (widget.cc * widget.TarrifCharge_Kvavalue *12) : 0;
    unitConsumed_B = widget.cc * widget.DailyWhours * 365;
    EnergyCharge_B = unitConsumed_B * widget.TarrifCharge_Kwvalue;

    ActualMaxDemand_A = widget.cc / widget.DesirePowerFactorvalue;
    MaxDemand_A = Equations()
        .calculateNumber(Equations().reduceDouble(ActualMaxDemand_A).round());
    KVADemandCharge_A =
    widget.cc > 500 ? (widget.cc * widget.TarrifCharge_Kvavalue *12) : 0;
    unitConsumed_A =
        widget.cc * widget.DailyWhours * 365;
    EnergyCharge_A = unitConsumed_A * widget.TarrifCharge_Kwvalue;

    Capitalcost = widget.CapacitorCost * widget.LeadingKVAR;
    AnnualInteandDep = Capitalcost.round() * (widget.AnnualIntrestvalue / 100);

    // Benefits After add Pf correction
    ReductionOfLosses = pow(widget.CurrentAfterpfcorrection, 2) /
        pow(widget.CurrentBeforepfcorrection, 2);


    //Penalty and bonus
    Penalty_Bonus_B = Equations().Penalty(widget.oldPowerFactorValue, EnergyCharge_B);
    Penalty_Bonus_A = Equations().Bonus(widget.DesirePowerFactorvalue, EnergyCharge_A);

    // TotalAnnualCost_A and B
    TotalAnnualCost_B = KVADemandCharge_B + EnergyCharge_B + Penalty_Bonus_B;
    TotalAnnualCost_A = KVADemandCharge_A + EnergyCharge_A + AnnualInteandDep.roundToDouble() + Penalty_Bonus_A;
    AnnualSaving = TotalAnnualCost_B - TotalAnnualCost_A;
    PayBackPeriod = (Capitalcost / AnnualSaving) * 365;


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 6),
          onPressed: () {
            navigatepop(context);
          },
          icon:  Icon(
            Icons.arrow_back,
            color: red,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.6),
        titleSpacing:AppBar().preferredSize.height * 0.1,
        title:  Text(
          "Before & After P.F Correction",
          style: GoogleFonts.kodchasan(
            fontStyle: FontStyle.italic,
            color: red,
            fontSize: 16,
            fontWeight: FontWeight.bold)
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
                Platform.isWindows? Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TableElementView(
                            result: Center(
                              child:
                              Column(mainAxisSize: MainAxisSize.max, children: <
                                  Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('Before PF Correction',
                                      style: GoogleFonts.kodchasan(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Table(
                                  textDirection: TextDirection.ltr,
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  border: const TableBorder(
                                      verticalInside: BorderSide(
                                          width: 1,
                                          color: Colors.green,
                                          style: BorderStyle.solid)),
                                  children: [
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(ActualMaxDemand_B)
                                            .toString(),
                                        title: 'Actual Max Demand',
                                        unit: 'kVA',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: ("${Equations()
                                            .reduceDouble(pow(
                                            widget
                                                .CurrentBeforepfcorrection,
                                            2)
                                            .toDouble())
                                            .round()}*R"),
                                        title: 'Losses',
                                        unit: 'W',
                                      ),
                                    ]),

                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(unitConsumed_B)
                                            .toString(),
                                        title: 'Annual Energy Consumption',
                                        unit: 'kWh',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(KVADemandCharge_B)
                                            .toString(),
                                        title: 'Max Demand Fixed Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: (Equations()
                                            .reduceDouble(EnergyCharge_B))
                                            .toString(),
                                        title: 'Consumed Energy Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(Penalty_Bonus_B)
                                            .toString(),
                                        title:'Penalty/Bonus',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(TotalAnnualCost_B)
                                            .toString(),
                                        title: 'Total Annual Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ]),
                            ),
                            resText: 'Before PF Correction',
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TableElementView(
                            result: Center(
                              child:
                              Column(mainAxisSize: MainAxisSize.max, children: <
                                  Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text('After PF Correction',
                                      style: GoogleFonts.kodchasan(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),

                                ),
                                Table(
                                  defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        unit: "kVA",
                                        result: Equations()
                                            .reduceDouble(ActualMaxDemand_A)
                                            .toDouble()
                                            .toString(),
                                        title: 'Actual Max Demand',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: "${Equations()
                                            .reduceDouble(pow(
                                            widget
                                                .CurrentAfterpfcorrection,
                                            2)
                                            .toDouble())
                                            .round()}*R",
                                        title: 'Losses',
                                        unit: 'W',
                                      ),
                                    ]),

                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(unitConsumed_A)
                                            .toString(),
                                        title: 'Annual Energy Consumption',
                                        unit: 'kWh',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(Capitalcost)
                                            .toString(),
                                        title: 'Capital Cost of Capacitors',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(AnnualInteandDep)
                                            .toString(),
                                        title:
                                        'Annual Int. & Dep',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(KVADemandCharge_A)
                                            .toString(),
                                        title: 'Max Demand Fixed Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),
                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(EnergyCharge_A)
                                            .toString(),
                                        title: 'Consumed Energy Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),

                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(Penalty_Bonus_A)
                                            .toString(),
                                        title: "Penalty/Bonus",
                                        unit: 'EGP',
                                      ),
                                    ]),


                                    TableRow(children: [
                                      ResultWithDialogView(
                                        result: Equations()
                                            .reduceDouble(TotalAnnualCost_A)
                                            .toString(),
                                        title: 'Total Annual Cost',
                                        unit: 'EGP',
                                      ),
                                    ]),

                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ]),
                            ),
                            resText: 'After PF Correction',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.screenHeight,
                      width: 95.screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
                                            color: white),
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 15, 15),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                                "Benefits of P.F Correction",
                                                style:  GoogleFonts.kodchasan(
                                                    color: red,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold)

                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Text(
                                                  "The losses in cables are reduced to ${(ReductionOfLosses * 100).round()}%"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "Annual Savings = ${Equations().reduceDouble(AnnualSaving)} EGP"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "Payback in ${Equations().reduceDouble(PayBackPeriod)} Days"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        child: const Text(
                          'Benefits of P.F Correction',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,)
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     height: 5.screenHeight,
                    //     width: 95.screenWidth,
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         navigateTo(
                    //             context,
                    //             ProtectionResult(
                    //               ic: widget.Ic,
                    //               LeadingKVAR: widget.LeadingKVAR,
                    //             ));
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: red,
                    //         shape: const RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.all(Radius.circular(5))),
                    //       ),
                    //       child: const Text(
                    //         'Protection of Capacitor Bank',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(fontSize: 14,color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ):Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TableElementView(
                      result: Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: <
                                Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Before PF Correction',
                                    style: GoogleFonts.kodchasan(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Table(
                                textDirection: TextDirection.ltr,
                                defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                                border: const TableBorder(
                                    verticalInside: BorderSide(
                                        width: 1,
                                        color: Colors.green,
                                        style: BorderStyle.solid)),
                                children: [
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: Equations()
                                          .reduceDouble(ActualMaxDemand_B)
                                          .toString(),
                                      title: 'Actual Max Demand',
                                      unit: 'kVA',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: "${Equations()
                                          .reduceDouble(pow(
                                          widget
                                              .CurrentBeforepfcorrection,
                                          2)
                                          .toDouble())
                                          .round()}*R",
                                      title: 'Losses',
                                      unit: 'W',
                                    ),
                                  ]),

                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: Equations()
                                          .reduceDouble(unitConsumed_B)
                                          .toString(),
                                      title: 'Annual Energy Consumption',
                                      unit: 'kWh',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: Equations()
                                          .reduceDouble(KVADemandCharge_B)
                                          .toString(),
                                      title: 'Max Demand Fixed Cost',
                                      unit: 'EGP',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: (Equations()
                                          .reduceDouble(EnergyCharge_B))
                                          .toString(),
                                      title: 'Consumed Energy Cost',
                                      unit: 'EGP',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: Equations()
                                          .reduceDouble(Penalty_Bonus_B)
                                          .toString(),
                                      title:"Penalty/Bonus",
                                      unit: 'EGP',
                                    ),
                                  ]),
                                  TableRow(children: [
                                    ResultWithDialogView(
                                      result: Equations()
                                          .reduceDouble(TotalAnnualCost_B)
                                          .toString(),
                                      title: 'Total Annual Cost',
                                      unit: 'EGP',
                                    ),
                                  ]),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                        ]),
                      ),
                      resText: 'Before PF Correction',
                    ),
                    TableElementView(
                      result: Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: <
                                Widget>[
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text('After PF Correction',
                                style: GoogleFonts.kodchasan(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),

                          ),
                      Table(
                        defaultVerticalAlignment:
                        TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            ResultWithDialogView(
                              unit: "kVA",
                              result: Equations()
                                  .reduceDouble(ActualMaxDemand_A)
                                  .toDouble()
                                  .toString(),
                              title: 'Actual Max Demand',
                            ),
                          ]),
                          TableRow(children: [
                            ResultWithDialogView(
                              result: "${Equations()
                                  .reduceDouble(pow(
                                  widget
                                      .CurrentAfterpfcorrection,
                                  2)
                                  .toDouble())
                                  .round()}*R",
                              title: 'Losses',
                              unit: 'W',
                            ),
                          ]),
                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(unitConsumed_A)
                                  .toString(),
                              title: 'Annual Energy Consumption',
                              unit: 'kWh',
                            ),
                          ]),
                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(Capitalcost)
                                  .toString(),
                              title: 'Capital Cost of Capacitors',
                              unit: 'EGP',
                            ),
                          ]),
                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(AnnualInteandDep)
                                  .toString(),
                              title:
                              'Annual Int. & Dep',
                              unit: 'EGP',
                            ),
                          ]),
                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(KVADemandCharge_A)
                                  .toString(),
                              title: 'Max Demand Fixed Cost',
                              unit: 'EGP',
                            ),
                          ]),

                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(EnergyCharge_A)
                                  .toString(),
                              title: 'Consumed Energy Cost',
                              unit: 'EGP',
                            ),
                          ]),

                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(Penalty_Bonus_A)
                                  .toString(),
                              title: "Penalty/Bonus",
                              unit: 'EGP',
                            ),
                          ]),


                          TableRow(children: [
                            ResultWithDialogView(
                              result: Equations()
                                  .reduceDouble(TotalAnnualCost_A)
                                  .toString(),
                              title: 'Total Annual Cost',
                              unit: 'EGP',
                            ),
                          ]),

                        ],
                      ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                      resText: 'After PF Correction',
                    ),
                    SizedBox(
                      height: 5.screenHeight,
                      width: 95.screenWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(10),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: double.infinity,
                                        height:300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: white),
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 15, 15),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "Benefits of P.F Correction",
                                              style:  GoogleFonts.kodchasan(
                                            color: red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)

                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Text(
                                                  "The losses in cables are reduced to ${(ReductionOfLosses * 100).round()}%"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "Annual Savings = ${Equations().reduceDouble(AnnualSaving)} EGP"),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Text(
                                                  "Payback in ${Equations().reduceDouble(PayBackPeriod)} Days"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: red,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        child: const Text(
                          'Benefits of PF Correction',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14,color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,)
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SizedBox(
                    //     height: 5.screenHeight,
                    //     width: 95.screenWidth,
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         navigateTo(
                    //             context,
                    //             ProtectionResult(
                    //               ic: widget.Ic,
                    //               LeadingKVAR: widget.LeadingKVAR,
                    //             ));
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: red,
                    //         shape: const RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.all(Radius.circular(5))),
                    //       ),
                    //       child: const Text(
                    //         'Protection of Capacitor Bank',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(fontSize: 14,color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
