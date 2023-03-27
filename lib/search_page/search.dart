import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// void main() => runApp(MyHomePage());

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [Color(0xFFFF85A2), Color(0xFFFFC9D9)],
            // colors: [Color(0xfff1e4f3), Color(0xfff686bd)],
            // colors: [Color(0xffe8d7ff), Color(0xfff1e4f3)],
            colors: [Color(0xFFFEFCF3), Color.fromARGB(255, 236, 235, 231)],
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            SearchField(),
            Expanded(child: MyGridView()),
          ],
        ),
      ),
    ));
  }
}

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

List list = [
  "Tops",
  "Bottoms",
  "Crop Top",
  "Gym Wear",
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
  'Item 6',
  'Item 7',
  'Item 8',
  'Item 9',
  'Item 10',
];

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: GFSearchBar(
        searchList: list,
        hideSearchBoxWhenItemSelected: false,
        searchQueryBuilder: (query, list) {
          return list
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        overlaySearchListItemBuilder: (dynamic item) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              item,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        onItemSelected: (dynamic item) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemPage(item: item),
            ),
          );
        },
        searchBoxInputDecoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.black87),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 161, 121, 107),
          // contentPadding: const EdgeInsets.only(left: 40.0),
          prefixIcon: const Icon(Icons.search, color: Colors.black87),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  // list of titles and images for the grid items
  final List<Map<String, dynamic>> _titlesAndImages = [
    {'title': 'Tops', 'image': 'top.jpeg'},
    {'title': 'Bottoms', 'image': 'bottom-wear.jpg'},
    {'title': 'Hats', 'image': 'hats.jpeg'},
    {'title': 'Shoes', 'image': 'shoes.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(30.0),
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: List.generate(
        _titlesAndImages.length,
        (index) {
          return GestureDetector(
            onTap: () {
              // navigate to the second screen here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      _titlesAndImages[index]['image'],
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                    ),
                  ),
                ),

                Positioned(
                  top: 200,
                  // bottom: -2,
                  left: 0,
                  right: 0,
                  // child: Container(
                  //   // padding: const EdgeInsets.all(5.0),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromARGB(255, 249, 247, 244),
                  //     // borderRadius: BorderRadius.only(
                  //     //   bottomLeft: Radius.circular(16.0),
                  //     //   bottomRight: Radius.circular(16.0),
                  //     ),
                  //   ),
                  child: Text(
                    _titlesAndImages[index]['title'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 106, 102, 102),
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: Color.fromARGB(255, 171, 110, 88),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  final String item;

  const ItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 171, 110, 88),
        title: Text(item),
      ),
      body: const Center(
        child: Text('This is the item page'),
      ),
    );
  }
}
