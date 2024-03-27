import 'package:flutter/material.dart';
import 'package:restaurant_app/data.dart';
import 'package:restaurant_app/widgets/widget_menu.dart';

class Detail extends StatelessWidget {
  static const routname = '/detail';

  final Restaurant restaurant;

  const Detail({super.key, required this.restaurant});

  List<Widget> buildMenuWidgets(
      List<String> menuItems, double height, double width, String jenis) {
    return menuItems.map((menuItem) {
      return menu(menuItem, height, width, jenis);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text(restaurant.name),
          elevation: 4,
          shadowColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(8)),
                      width: constraints.maxWidth,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Hero(
                          tag: restaurant.pictureId,
                          child: Image.network(
                            restaurant.pictureId,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant.name,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            Text(restaurant.city)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: constraints.maxWidth,
                      height: 200,
                      child: Text(restaurant.description),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '${restaurant.rating}/5',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Makanan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: buildMenuWidgets(
                            restaurant.menus.foods, 150, 120, 'foods'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Minuman',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: buildMenuWidgets(
                            restaurant.menus.drinks, 150, 120, 'drink'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
