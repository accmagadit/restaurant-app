import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/widgets/widget_restaurant.dart';

void main(List<String> args) {
  runApp(const RestaurantCity());
}

class RestaurantCity extends StatefulWidget {
  static const routname = '/restaurant_city';

  const RestaurantCity({Key? key}) : super(key: key);

  @override
  State<RestaurantCity> createState() => _RestaurantCityState();
}

class _RestaurantCityState extends State<RestaurantCity> {
  List<Restaurant>? restaurants;
  late String cityFilter;

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

  List<Widget> buildCityRestaurant() {
    if (restaurants == null || restaurants!.isEmpty) {
      return [const Text('loading...')];
    }

    List<Widget> filteredRestaurants = restaurants!
        .where((restaurant) => restaurant.city.toLowerCase() == cityFilter)
        .map((restaurant) {
      return restaurantWidget(context, restaurant, 90, 90);
    }).toList();

    if (filteredRestaurants.isEmpty) {
      return [const Text('No restaurants found in this city.')];
    }

    return filteredRestaurants;
  }

  @override
  Widget build(BuildContext context) {
    // Extract cityFilter and restaurants from ModalRoute settings
    Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Set cityFilter after extracting it
    cityFilter = args?['city'] as String? ?? '';

    // Set restaurants after extracting it
    List<Restaurant>? cityRestaurants =
        args?['restaurants'] as List<Restaurant>? ?? [];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              title: Text(cityFilter),
              elevation: 4,
              shadowColor: Colors.blueAccent,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //putih
                  Container(
                    color: const Color(0xffFCFCFC),
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //All
                          const SizedBox(
                            height: 20,
                          ),
                          Column(children: buildCityRestaurant()),
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
