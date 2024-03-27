import 'package:flutter/material.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/restaurant_city.dart';

Widget lokasi(BuildContext context, List<Restaurant> restaurants,String city, double width, double height) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, RestaurantCity.routname, arguments: {'city':city.toLowerCase(),'restaurant':restaurants});
    },
    child: Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            width: width,
            height: height,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6.9,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(50, 0, 0, 0),
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Image.asset(
              'assets/images/${city.toLowerCase()}.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            city,
            style: TextStyle(color: Color(0xff8A8A8A)),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
