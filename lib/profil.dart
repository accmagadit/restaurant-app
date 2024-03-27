import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  static const routname = '/profile';

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff2B3499),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.person_pin, size: 170),
              const Text(
                'Yohohohoho',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'medan',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color(0xff2B3499),
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: const Text(
                  'Rp 20.000',
                  style: TextStyle(fontSize: 20, color: Color(0xffffffff)),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'yohohoho@gmail.com',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: '**********', prefixIcon: Icon(Icons.lock)),
                ),
              ),
              const Row()
            ],
          ),
        ),
      ),
    );
  }
}
