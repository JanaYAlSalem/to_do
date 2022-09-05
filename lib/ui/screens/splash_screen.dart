import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
            // ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())
          // () => Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => ChangeNotifierProvider(
          //     create: (_) => TaskData(), child: HomeScreen()))
          // ),
            () => Modular.to.navigate('/home')

    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Lottie.asset('Asset/images/splash.json'),

      // FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
