import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfcalulator/components/components.dart';
import 'package:pfcalulator/data/equations.dart';
import 'package:pfcalulator/screens/widgets/text_views.dart';

import '../style/colors.dart';

class ProtectionResult extends StatefulWidget {
  const ProtectionResult({Key? key, required this.ic, required this.LeadingKVAR})
      : super(key: key);
  final double ic;
  final double LeadingKVAR;

  @override
  State<ProtectionResult>  createState() => _ProtectionResultState();
}

class _ProtectionResultState extends State<ProtectionResult> {
  double SizeOfFuse1 = 0;
  double SizeOfFuse2 = 0;
  double SizeofCircuitBreaker = 0;
  double ThermalSetting = 0;
  double MagneticSetting = 0;
  double SizeofCable = 0;

  void initState() {
    SizeOfFuse1 = 1.65 * widget.ic;
    SizeOfFuse2 = 2 * widget.ic;

    SizeofCircuitBreaker = 1.5 * widget.ic;
    ThermalSetting = 1.5 * widget.ic;
    MagneticSetting = 10 * widget.ic;
    SizeofCable = Equations().SizeofCable(widget.LeadingKVAR, widget.ic);
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
        leading: IconButton(onPressed: () { navigatepop(context); },icon:  Icon( Icons.arrow_back,color: red,)  , ),
        backgroundColor: Colors.white.withOpacity(0.6),
        titleSpacing:AppBar().preferredSize.height * 0.1,
        title:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Protection of Capacitor Bank Results",
             style: GoogleFonts.kodchasan(
              fontStyle: FontStyle.italic,
              color: red,
              fontSize: 16,
              fontWeight: FontWeight.bold
        ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/images/splash/BackgroundLight.svg",
              width: double.infinity, height: double.infinity, fit: BoxFit.fill),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: AppBar().preferredSize.height * 1.5,),
                  ResultView(
                    resText: "First Value Size of Main Fuse",
                    result: Equations().reduceDouble(SizeOfFuse1),
                    unit: "Amp",
                  ),
                  ResultView(
                    resText: "Second Value Size of Main Fuse",
                    result: Equations().reduceDouble(SizeOfFuse2),
                    unit: "Amp",
                  ),
                  ResultView(
                    resText: "Size of Circuit Breaker",
                    result: Equations().reduceDouble(SizeofCircuitBreaker),
                    unit: "Amp",
                  ),
                  ResultView(
                      resText: "Thermal Setting of C.B",
                      result: Equations().reduceDouble(ThermalSetting),
                    unit: "Amp",
                  ),
                  ResultView(
                      resText: "Magnetic Setting of C.B",
                      result: Equations().reduceDouble(MagneticSetting),
                    unit: "Amp",

                  ),
                  ResultView(
                      resText: "Size of Cable For C.C",
                      result: Equations().reduceDouble(SizeofCable),
                    unit: "Amp",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
