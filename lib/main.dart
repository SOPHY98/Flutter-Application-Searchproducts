import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _allProducts = [
    {"id": 1, "title": "favourites Page", "page": "favorites()", "name": "Norvasc", "product": "medication", "brand": "Norvasc", "image":"assets/norvc.jpg"},
    {"id": 2,"title": "favourites Page", "page": "favourites()", "name": "MedLemon", "product": "medication", "brand": "MedLemon", "image":"assets/MedLemon.jpg"},
    {"id": 3,"title": "favourites Page", "page": "favourites()", "name": "MiraLux", "product": "medication", "brand": "MiruLux", "image":"assets/MiraLux.jpg"},
    {"id": 4,"title": "favourites Page", "page": "favourites()", "name": "Nivea", "product": "cosmatic", "brand": "Nivea", "image":"assets/nivea.jpg"},
    {"id": 5,"title": "favourites Page", "page": "favourites()", "name": "Johnson's", "product": "cosmatic", "brand": "Johnson's & Johnson's", "image":"assets/Johnson's.jpg"},
    {"id": 6,"title": "favourites Page", "page": "favourites()", "name": "Addis Cloth", "product": "cosmatic", "brand": "addis", "image":"assets/Addis.jpg"},
    {"id": 7,"title": "favourites Page", "page": "favourites()", "name": "Addis", "product": "House Appliance", "brand": "Addis", "image":"assets/addis.jpg"},
    {"id": 8,"title": "favourites Page", "page": "favourites()", "name": "Air Scent", "product": "Diffuser Lavender", "brand": "Air Scent", "image":"assets/AirScent.jpg"},
    {"id": 9,"title": "favourites Page", "page": "favourites()", "name": "Always", "product": "Pads", "brand": "Always", "image":"assets/always.jpg"},
    {"id": 10,"title": "favourites Page", "page": "favourites()", "name": "Acodol", "product": "medication", "brand": "Acodol", "image":"assets/acodol.jpg"},
    {"id": 11,"title": "favourites Page", "page": "favourites()", "name": "Alpecin", "product": "medication", "brand": "Alpecin", "image":"assets/alpecin.jpg"},
    {"id": 12,"title": "favourites Page", "page": "favourites()", "name": "Amarula", "product": "medication", "brand": "Amarula", "image":"assets/amarula.jpg"},
    {"id": 13,"title": "favourites Page", "page": "favourites()", "name": "Aquafresh", "product": "Toothbrush", "brand": "Aquafresh", "image":"assets/aquafresh.jpg"},
    {"id": 14,"title": "favourites Page", "page": "favourites()", "name": "Dark n Lovely", "product": "Styling Gel", "brand": "Dark n Lovely", "image":"assets/dark and lovely.jpg"},
    {"id": 15,"title": "favourites Page", "page": "favourites()", "name": "Lifebouy", "product": "Hand Sanitizer", "brand": "Lifebouy", "image":"assets/lifebouy.jpg"},
    {"id": 16,"title": "favourites Page", "page": "favourites()", "name": "Vicks", "product": "medication", "brand": "Vicks", "image":"assets/vicks.jpg"},
    {"id": 17,"title": "favourites Page", "page": "favourites()", "name": "Panado", "product": "medication", "brand": "Panado", "image":"assets/panado.jpg"},
    {"id": 18,"title": "favourites Page", "page": "favourites()", "name": "Xtandi", "product": "medication", "brand": "Xtandi", "image":"assets/norvc.jpg"},
    {"id": 19,"title": "favourites Page", "page": "favourites()", "name": "Aloe24", "product": "medication", "brand": "Aloe24", "image":"assets/aloe24.jpg"},
    {"id": 20,"title": "favourites Page", "page": "favourites()", "name": "Colgate", "product": "Cosmatic", "brand": "Colgate", "image":"assets/norvc.jpg"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundProducts = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundProducts = _allProducts;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allProducts;
    } else {
      results = _allProducts
          .where((product) =>
          product["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundProducts = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmaceutical products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundProducts.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundProducts.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundProducts[index]["id"]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundProducts[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundProducts[index]['name']),

                    subtitle: Text(
                        _foundProducts[index]['product']),

                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
             //
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
      child: GestureDetector(
        OnTop: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) {
                  return Scaffold(
                     appBar: AppBar(
                      title: Text(
                        'foundProducts[index]['title'],
                 }
                  child: const Text('Favorite page'),
                    onPressed: () {
          // Navigate to second route when tapped.
        },
      ),
    ),
  );
}
}*/