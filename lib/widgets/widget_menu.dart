import 'package:flutter/material.dart';

Widget menu(String menu, double height, double width, String jenis) {
  String image = '';
  if (jenis == 'foods') {
    image = 'assets/images/makanan.jpg';
  } else {
    image = 'assets/images/minuman.jpg';
  }
  return Container(
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
          child: Column(
            children: [
              Container(
                width: 100,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black45,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    )),
              ),
              Text(menu)
            ],
          ),
        ),
      ],
    ),
  );
}
