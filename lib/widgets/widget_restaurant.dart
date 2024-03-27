import 'package:flutter/material.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/detail.dart';

Widget restaurantWidget(
    BuildContext context, Restaurant restaurant, double height, double width) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, Detail.routname, arguments: restaurant);
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black45,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                restaurant.name,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                restaurant.description.substring(0, 38) + '..',
                style: const TextStyle(fontWeight: FontWeight.w300),
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
  );
}
