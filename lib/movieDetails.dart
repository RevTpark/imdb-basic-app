import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;



class GetMovieDetailsPage extends StatefulWidget {
  final movieTitle;
  const GetMovieDetailsPage(this.movieTitle, {Key? key}) : super(key: key);

  @override
  _GetMovieDetailsPageState createState() => _GetMovieDetailsPageState(movieTitle);
}

class _GetMovieDetailsPageState extends State<GetMovieDetailsPage> {
  var moviesDetails;
  final movieTitle;

  _GetMovieDetailsPageState(this.movieTitle) {
    getMovieDetails(movieTitle);
  }

  getMovieDetails(var title) async{
    var url = "http://www.omdbapi.com/?apikey=ca4430d&t="+ title;
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    //print(responseData["Poster"]);
    setState(() {
      moviesDetails = responseData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Name:", style: TextStyle(fontWeight: FontWeight.bold),),
            moviesDetails != null?Text("${moviesDetails["Title"]}"):const Text("Loading..."),
          ],
        ),
        Row(
          children:[
            const Text("Year:", style: TextStyle(fontWeight: FontWeight.bold),),
            moviesDetails != null?Text("${moviesDetails["Year"]}"):const Text("Loading..."),
          ],
        ),
        Row(
          children:[
            const Text("Plot:", style: TextStyle(fontWeight: FontWeight.bold),),
            Flexible(
                child: moviesDetails != null?Text("${moviesDetails["Plot"]}"):const Text("Loading..."),
            ),
          ],
        ),
        Row(
          children:[
            const Text("Genre:", style: TextStyle(fontWeight: FontWeight.bold),),
            moviesDetails != null?Text("${moviesDetails["Genre"]}"):const Text("Loading..."),
          ],
        ),
        Row(
          children:[
            const Text("RunTime:", style: TextStyle(fontWeight: FontWeight.bold),),
            moviesDetails != null?Text("${moviesDetails["Runtime"]}"):const Text("Loading..."),
          ],
        ),
      ],
    );
  }
}
