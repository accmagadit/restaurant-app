import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/widgets/widget_city.dart';
import 'package:restaurant_app/widgets/widget_populer.dart';
import 'package:restaurant_app/widgets/widget_restaurant.dart';

void main(List<String> args) {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/datas/local_restaurant.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);

      if (jsonData.containsKey('restaurants')) {
        List<dynamic> jsonRestaurants = jsonData['restaurants'];
        restaurants = jsonRestaurants
            .map((jsonData) => Restaurant.fromJson(jsonData))
            .toList();
        setState(() {});
      } else {
        print("Error: 'restaurants' key not found in the JSON.");
      }
    } catch (error) {
      print("Error loading JSON data: $error");
    }
  }

  List<Widget> buildCityWidget(List<Restaurant> restaurants) {
    if (restaurants.isEmpty || restaurants == null) {
      return [const Text('loading...')];
    }

    Set<String> uniqueCities =
        restaurants.map((restaurant) => restaurant.city.toLowerCase()).toSet();

    return uniqueCities
        .map((uniqueCity) => lokasi(context, restaurants, uniqueCity, 90, 90))
        .toList();
  }

  List<Widget> buildAllRestaurant() {
    if (restaurants.isEmpty || restaurants == null) {
      return [const Text('loading...')];
    }

    return restaurants.map((restaurant) {
      return restaurantWidget(context, restaurant, 90, 90);
    }).toList();
  }

  List<Widget> buildPopularRestaurant() {
    if (restaurants.isEmpty || restaurants == null) {
      return [const Text('loading...')];
    }

    return restaurants.take(2).map((restaurant) {
      return popular(context,restaurant, 120, 220);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //biru
                  Container(
                    width: constraints.maxWidth,
                    height: 150,
                    color: const Color(0xff2B3499),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hai, Yohoho',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Mau Makan Dimana Nih?',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  //putih
                  Container(
                    color: const Color(0xffFCFCFC),
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //lokasi
                          const Text(
                            'Lokasi',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff2B3499),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: buildCityWidget(restaurants)),
                          ),

                          //popular
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff2B3499),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: buildPopularRestaurant()),
                          ),

                          //All
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'All',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff2B3499),
                            ),
                          ),
                          Column(children: buildAllRestaurant()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
