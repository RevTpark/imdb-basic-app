import 'package:flutter/material.dart';
import 'package:imdb_basic_project/widgets/UserPage.dart';
import 'package:imdb_basic_project/widgets/getMovies.dart';
import 'package:imdb_basic_project/widgets/searchMovies.dart';
import 'package:imdb_basic_project/widgets/userDetails.dart';

void main() {
  runApp(const MyApp());
}


class HomePage extends StatefulWidget {
  final username;
  final userDetails;
  const HomePage(this.username, this.userDetails, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(username,userDetails);
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final username;
  final userDetails;

  _HomePageState(this.username, this.userDetails);

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
        GetUserDetailsPage(username, userDetails)
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
        home: GetUserDetails(),
    );
  }
}
