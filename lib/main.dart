import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_basic_project/UserPage.dart';
import 'package:imdb_basic_project/getMovies.dart';
import 'dart:convert' show jsonDecode, json;
import 'searchMovies.dart';

void main() {
  runApp(const MyApp());
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //static const categories = ["time", "marvel", "one", "fight"];
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Movies"),
      ),
      body: [
        GetMoviesPage(),
        searchMoviesPage(),
        GetUserDetailsPage()
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "User Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Movies on Imdb",
        home: HomePage()
    );
  }
}
