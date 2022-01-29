import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:imdb_basic_project/widgets/movieDetails.dart';


class searchMoviesPage extends StatefulWidget {
  const searchMoviesPage({Key? key}) : super(key: key);

  @override
  _searchMoviesPageState createState() => _searchMoviesPageState();
}

class _searchMoviesPageState extends State<searchMoviesPage> {

  List<dynamic> movies = [];
  final _searchController = TextEditingController();

  callApi(var param, var name) async {
  }

  void _searchTitles() async{

    var url = "http://www.omdbapi.com/?apikey=ca4430d&s=" + _searchController.text;
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body)["Search"];
    //print(responseData);
    setState(() {
      movies = [];
      for(var item in responseData){
        movies.add(item["Title"]);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child:
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child:
                TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(labelText: "Search Movie by Title")
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _searchTitles,
                child: const Text('Search'),
              ),
            ),
          ],
          ),
          Expanded(
              child: ListView.builder(

              itemBuilder: (context, i){
                return Column(
                  children: [
                    ListTile(
                      title: Text(movies[i], textAlign: TextAlign.center,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          settings: const RouteSettings(name: "/details"),
                          builder: (context) =>
                              Scaffold(
                                appBar: AppBar(
                                  title: const Text("Details of Movie"),
                                ),
                                body: GetMovieDetailsPage(movies[i]),
                              ),
                        ));
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
              itemCount: movies.length,
          ),
          ),
        ],
      );
    }
  }
