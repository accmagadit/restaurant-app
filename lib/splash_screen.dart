import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/app.dart';

void main(List<String> args) {
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  static const routname = '/splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const App()));
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xffFCFCFC),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset('assets/images/logo.png'),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'v 1.0.0',
                  style: TextStyle(fontFamily: 'roboto-light', fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
