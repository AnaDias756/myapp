import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> titles = ["", "", ""];

  final List<Widget> images = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: const Icon(Icons.add_box_rounded, color: Colors.blue, size: 100.0),
    ),
  ];
  
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ana'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh))
        ]
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: VerticalCardPager(
                titles: titles, // required
                images: images, // required
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ), // optional
                onSelectedItem: onSelectedItem,
                initialPage: 0, // optional
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelectedItem(int index) {
    if (index == titles.length - 1) {
      Navigator.pushNamed(context, "/new");
    }
  }
}
