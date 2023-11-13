import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapps/view/homescreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/splash_pic.jpg",fit: BoxFit.cover,width:width*.9,
          height: height*.5,
          ),
          SizedBox(height: height*0.04,),
          Text("TOP HEADLINE",style: GoogleFonts.anton(letterSpacing: .6,color: Colors.grey.shade700),),
          SizedBox(height: height*0.04,),
          SpinKitChasingDots(
            color: Colors.blue,
            size:40,
          )
        ],
      ),
    );
  }
}
