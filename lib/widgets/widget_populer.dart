import 'package:flutter/material.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/detail.dart';
import 'package:restaurant_app/widgets/detailPopular.dart';

Widget popular(
    BuildContext context, Restaurant restaurant, double height, double width) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, DetailPopular.routname, arguments: restaurant);
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: width,
            height: height,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 7,
                  blurStyle: BlurStyle.outer,
                  color: Color.fromARGB(50, 0, 0, 0),
                  offset: Offset(0, 4))
            ], borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black45,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: '${restaurant.pictureId}popular',
                        child: Image.network(
                          restaurant.pictureId,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.red),
                        Text(
                          restaurant.city,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '${restaurant.rating}/5',
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
