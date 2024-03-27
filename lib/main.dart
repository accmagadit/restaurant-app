import 'package:flutter/material.dart';
import 'package:restaurant_app/app.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/detail.dart';
import 'package:restaurant_app/profil.dart';
import 'package:restaurant_app/restaurant_city.dart';
import 'package:restaurant_app/splash_screen.dart';
import 'package:restaurant_app/widgets/detailPopular.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routname,
      routes: {
        SplashScreen.routname: (context) => const SplashScreen(),
        App.routname: (context) => const App(),
        Detail.routname: (context) => Detail(restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,),
        DetailPopular.routname: (context) => DetailPopular(restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,),
        Profile.routname: (context) => const Profile(),
        RestaurantCity.routname: (context) => RestaurantCity(),
      },
    );
  }
}
