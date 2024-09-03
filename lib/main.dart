import 'dart:io';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfcalulator/screens/mainscreen.dart';
import 'package:pfcalulator/style/colors.dart';
import 'package:window_manager/window_manager.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WindowManager.instance.setMinimumSize(const Size(300, 600));
    WindowManager.instance.setMaximumSize(const Size(700, 600));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.robotoFlex().fontFamily,

              primarySwatch: Colors.blue,
            ),
            home: AnimatedSplashScreen(
              duration: 3000,
              splash: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (Platform.isWindows)Stack(alignment: Alignment.center, children: [
                SvgPicture.asset("assets/images/splash/Desk Background.svg",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SvgPicture.asset("assets/images/splash/Logo 2.svg",
                          width : 50.screenWidth,
                          height : 50.screenWidth,
                          fit: BoxFit.fill),
                      // Image.asset(
                      //   width : 50.screenWidth,
                      //   height : 50.screenWidth,
                      //   'assets/images/Logo.png',
                      //   fit: BoxFit.fill,
                      // ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Power Factor",
                              style: GoogleFonts.kodchasan(
                                  color: Colors.white,
                                  fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,)),
                          Text("Correction",style: GoogleFonts.kodchasan(
                              color: Colors.white,
                              fontSize: 30
                              , fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
                          ),
                        ],)
                    ],),
                )
              ]) else Stack(alignment: Alignment.center, children: [
                      SvgPicture.asset("assets/images/splash/Background.svg",
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SvgPicture.asset("assets/images/splash/Logo 2.svg",
                                width : 80.screenWidth,
                                height : 80.screenWidth,
                                fit: BoxFit.fill),
                            // Image.asset(
                            //   width : 50.screenWidth,
                            //   height : 50.screenWidth,
                            //   'assets/images/Logo.png',
                            //   fit: BoxFit.fill,
                            // ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Power Factor",
                                    style: GoogleFonts.kodchasan(
                                      color: Colors.white,
                                      fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,)),
                                Text("Correction",style: GoogleFonts.kodchasan(
                                  color: Colors.white,
                                  fontSize: 30
                                  , fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
                                ),
                              ],)
                          ],),
                      )
                    ]),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                          child: Text(
                            "Version 1.0.0.1",
                            style: TextStyle(
                                fontSize: 11,
                                color: white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
              ),
              nextScreen:  PFEntries(),
              splashTransition: SplashTransition.fadeTransition,
              splashIconSize: 2000,
              backgroundColor: Colors.white,
            ));
      }
    );
  }
}
