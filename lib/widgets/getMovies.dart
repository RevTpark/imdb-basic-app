import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:imdb_basic_project/widgets/movieDetails.dart';
import 'dart:math';

class GetMoviesPage extends StatefulWidget {
  const GetMoviesPage({Key? key}) : super(key: key);

  @override
  _GetMoviesPageState createState() => _GetMoviesPageState();
}

class _GetMoviesPageState extends State<GetMoviesPage> {
  var _moviesList = [];
  static const categories = ["time", "marvel", "one", "fight", "danger", "robot", "future", "world"];

  _buildRow(var movieContext) {
    //callApi("s", movieTitle);
    return Card(
      elevation: 4.0,
      color: Colors.grey,
      child: Column(
        children: [
          ListTile(
            title: Text(
              movieContext[0],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap:() {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) =>
                Scaffold(
                  appBar: AppBar(
                    title: const Text("Details of Movie"),
                  ),
                  body: GetMovieDetailsPage(movieContext[0]),
                ),
            ));
          },
        ),
        Container(
          height: 200.0,
          margin: EdgeInsets.only(bottom: 15.0),
          child: Image.network(
              movieContext[1],
              fit: BoxFit.cover,
          ),
        )
        ],
      ),
    );
  }

  getListOfMovies(var param, var title) async{
    var url = "http://www.omdbapi.com/?apikey=ca4430d&s=" + title;
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body)["Search"];
    //print(responseData);
    setState(() {
      for(var item in responseData){
        _moviesList.add([item["Title"],item["Poster"]]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();

            final index = i ~/ 2;
            //print(index);
            if (index >= _moviesList.length) {
              //print("ENTERED HERE");
              getListOfMovies("s", categories[Random().nextInt(categories.length)]);
            }
            //print(_moviesList);

            return index >= _moviesList.length?const Text("Loading...."):_buildRow(_moviesList[index]);
          });
    }
  }


