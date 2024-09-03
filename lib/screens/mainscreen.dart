import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_builder/responsive_builder.dart';
import '../components/components.dart';
import '../components/edit_textfield.dart';
import '../style/colors.dart';
import 'baseresult.dart';

class PFEntries extends StatefulWidget {
  const PFEntries({Key? key}) : super(key: key);

  @override
  State<PFEntries> createState() => _PFEntriesState();
}

class _PFEntriesState extends State<PFEntries> {
  final List<String> itemsUnit = [
    'kW',
    'HP',

  ];
  final List<String> itemsDS = [
    'Star',
    'Delta',
  ];
  final List<String> itemsNum = [
    '1',
    '3',
  ];
  String? dsSelection;
  String? unitSelection;
  String? numSelection;
  final SupplyVoltage = TextEditingController();
  final SupplyFrequency = TextEditingController();
  final Efficiency = TextEditingController();
  final InputPower = TextEditingController();
  final OldPowerFactor = TextEditingController();
  final DesirePowerFactor = TextEditingController();
  final DailyWorkingHours = TextEditingController();
  final TarrifCharge_Kva = TextEditingController();
  final TarrifCharge_Kw = TextEditingController();
  final Capacitor = TextEditingController();
  final AnnualIntrest = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkRed,
      body: Stack(children: [
        Platform.isWindows ? SvgPicture.asset("assets/images/splash/Desk Background.svg",
            width: double.infinity, height: double.infinity, fit: BoxFit.fill) : SvgPicture.asset("assets/images/splash/Background.svg",
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top,),
              Platform.isWindows ? SizedBox(
                height: AppBar().preferredSize.height * 1.5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Power Factor Correction",
                        style: GoogleFonts.kodchasan(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SvgPicture.asset("assets/images/splash/Logo 2.svg",
                        width: 5.screenWidth,
                        height: 20.screenWidth,
                        fit: BoxFit.fill),
                  ],
                ),
              ) :
              SizedBox(
                height: AppBar().preferredSize.height * 1.5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Power Factor Correction",
                        style: GoogleFonts.kodchasan(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SvgPicture.asset("assets/images/splash/Logo 2.svg",
                        width: 3.screenWidth,
                        height: 18.screenWidth,
                        fit: BoxFit.fill),
                  ],
                ),
              ),
              Expanded(
                child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: Platform.isWindows ? 3 : 5 / 2,
                    crossAxisCount: Platform.isWindows ? 3 : 2,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField2(
                        decoration: const InputDecoration(
                             errorStyle: TextStyle(
                            fontSize: 0.5
                                      ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellowAccent))
                        ),
                        isExpanded: true,
                        hint: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Supply System',
                                style: GoogleFonts.kodchasan(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: itemsNum
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: GoogleFonts.kodchasan(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: numSelection,
                        onChanged: (value) {
                          setState(() {
                            numSelection = value as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 160,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: red,
                            ),
                            color: red,
                          ),
                          elevation: 1,
                        ),
                        iconStyleData: IconStyleData(
                          icon: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: darkRed,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: darkRed,
                          iconDisabledColor: darkRed,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return '';
                          }

                          return null;
                        },
                        dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 100,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: red,
                            ),
                            elevation: 8,
                            offset: const Offset(25, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility:
                                  MaterialStateProperty.all(true),
                            )),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                    EditText(
                      labelText: 'Supply Voltage',
                      controller: SupplyVoltage,
                      textHint: "Enter Supply Voltage",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        }else if (num.parse(value) > 1900000) {
                          return 'Your limit is 1900000';
                        }
                        return null;
                      },
                    ),

                    EditText(
                      labelText: 'Supply Frequency',
                      controller: SupplyFrequency,
                      textHint: "Supply Frequency",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (num.parse(value) > 1050) {
                          return 'Your limit is 1050';
                        }
                        return null;
                      },
                    ),
                    EditText(
                      labelText: 'Efficiency(%)',
                      controller: Efficiency,
                      textHint: "Enter Efficiency",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        }
                        else if (num.parse(value).toInt() > 100) {
                          return 'Your limit is -100:100';
                        }
                        return null;
                      },
                    ),
                    // input power
                    EditText(
                      labelText: 'Output Power',
                      controller: InputPower,
                      textHint: "Enter Output Power",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if ( num.parse(value).toInt() > 14000000 ) {
                          return 'Your limit is 14000000';
                        }
                        return null;
                      },
                    ),
                    Padding(

                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 165,
                        child: DropdownButtonFormField2(
                          decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 0.5
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellowAccent))
                          ),
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Output Power Unit',
                                  style: GoogleFonts.kodchasan(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: itemsUnit
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.kodchasan(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: unitSelection,
                          onChanged: (value) {
                            setState(() {
                              unitSelection = value as String;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "";

                            }

                            return null;
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 160,
                            padding:
                                const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: red,
                              ),
                              color: red,
                            ),
                            elevation: 1,
                          ),
                          iconStyleData: IconStyleData(
                            icon: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: darkRed,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                            iconSize: 14,
                            iconEnabledColor: red,
                            iconDisabledColor: red,
                          ),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 100,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: red,
                              ),
                              elevation: 8,
                              offset: const Offset(25, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              )),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),

                    EditText(
                      labelText: 'Existing Power Factor (Cosф1)',
                      controller: OldPowerFactor,
                      textHint: "Existing Power Factor (Cosф1)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 1) {
                          return 'Your limit -1 : 1';
                        }
                        return null;
                      },
                    ),
                    EditText(
                      labelText: 'Desired Power Factor(Cosф2)',
                      controller: DesirePowerFactor,
                      textHint: "Desired Power Factor(Cosф2)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 1 ) {
                          return 'Your limit -1 : 1';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 165,
                        child: DropdownButtonFormField2(
                          decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                  fontSize: 0.5
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellowAccent))
                          ),
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Capacitor Connection',
                                  style: GoogleFonts.kodchasan(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: itemsDS
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.kodchasan(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: dsSelection,
                          onChanged: (value) {
                            setState(() {
                              dsSelection = value as String;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "";
                            }
                            return null;
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 160,
                            padding:
                                const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: red,
                              ),
                              color: red,
                            ),
                            elevation: 1,
                          ),
                          iconStyleData: IconStyleData(
                            icon: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: darkRed,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                            iconSize: 14,
                            iconEnabledColor: red,
                            iconDisabledColor: red,
                          ),
                          dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 100,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: red,
                              ),
                              elevation: 8,
                              offset: const Offset(25, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              )),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    EditText(
                      labelText: 'Daily Working Hours',
                      controller: DailyWorkingHours,
                      textHint: "Daily Working Hours",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (int.parse(value) > 24 ) {
                          return 'Your limit 1 : 24';
                        }
                        return null;
                      },
                    ),

                    EditText(
                      labelText: 'Max Demand Cost(EGP/kW.month)',
                      controller: TarrifCharge_Kva,
                      textHint: "Max Demand Cost(EGP/kW.month)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 100000 ) {
                          return 'Your limit 100000';
                        }
                        return null;
                      },
                    ),
                    EditText(
                      labelText: 'Energy Cost(EGP/kWh)',
                      controller: TarrifCharge_Kw,
                      textHint: "Energy Cost(EGP/kWh)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 100000 ) {
                          return 'Your limit 100000';
                        }
                        return null;
                      },
                    ),

                    EditText(
                      labelText: 'Capacitor Cost(EGP/kVAR)',
                      controller: Capacitor,
                      textHint: "Capacitor Cost(EGP/kVAR)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 100000 ) {
                          return 'Your limit 100000';
                        }
                        return null;
                      },
                    ),
                    EditText(
                      labelText: 'Annual Int. & Dep(%)',
                      controller: AnnualIntrest,
                      textHint: "Annual Int. & Dep(%)",
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be Empty';
                        }else if (value == "+" || value == "-") {
                          return 'Enter The Right value';
                        } else if (double.parse(value) > 100 ) {
                          return 'Your limit 100';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: MaterialButton(
                    height: 50,
                    minWidth: 160,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: red, width: 1, style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0))),
                    color: red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.equal_circle_fill,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Result',
                          style: GoogleFonts.kodchasan(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          navigateTo(
                              context,
                              BaseResult(
                                SupplySystemvalueS: numSelection,
                                SupplyVoltagevalue:
                                    double.parse(SupplyVoltage.text),
                                Efficiencyvalue: double.parse(Efficiency.text),
                                SupplyFrequencyvalue:
                                    double.parse(SupplyFrequency.text),
                                InputPowervalue: double.parse(InputPower.text),
                                OldPowerFactorvalue:
                                    double.parse(OldPowerFactor.text),
                                DesirePowerFactorvalue:
                                    double.parse(DesirePowerFactor.text),
                                DailyWorkingHoursvalue:
                                    double.parse(DailyWorkingHours.text),
                                TarrifCharge_Kvavalue:
                                    double.parse(TarrifCharge_Kva.text),
                                TarrifCharge_Kwvalue:
                                    double.parse(TarrifCharge_Kw.text),
                                Capacitorvalue: double.parse(Capacitor.text),
                                AnnualIntrestvalue:
                                    double.parse(AnnualIntrest.text),
                                unit: unitSelection,
                                DS: dsSelection,
                              ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: red,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  title: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.warning,size: 30,color: Colors.yellow,),
                                            Text(
                                              "  Warning!",
                                              style: TextStyle(color: white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Wrong Entry!",
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "    - Field is empty!",
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "    - Wrong value!",
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 8),
                                      child: MaterialButton(
                                        color: white,
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: green,
                                                width: 1,
                                                style: BorderStyle.solid),
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(5.0))),
                                        textColor: greenDark,
                                        child: const Text('OK'),
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    } //validateAndSave(),

                    ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: MaterialButton(
                    height: 50,
                    minWidth: 160,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: red, width: 1, style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0))),
                    color: red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.replay_circle_filled_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Clear All',
                          style: GoogleFonts.kodchasan(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      navigateAndFinish(context, widget);
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
