import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import '../getApi.dart';


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
    //print(responseData["Poster"]);x
    setState(() {
      moviesDetails = responseData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          shrinkWrap: true,
          children: <Widget>[
            moviesDetails != null?Container(
              margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
              child: Text(
                "${moviesDetails["Title"]}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 35.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(7.0, 5.0),
                        blurRadius: 3.0,
                        color: Colors.grey,
                      ),
                  ],
                ),
              ),
            ):const Text("Loading...", textAlign: TextAlign.center,),
            Container(
              //height: 200.0,
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: moviesDetails != null?Image.network(moviesDetails["Poster"],
                fit: BoxFit.cover,):Image.asset("images/loading.jpg")
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: moviesDetails != null?const Text("Plot of the Movie",
                textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),):const Text("Loading..."),
            ),
            Container(
                child: moviesDetails != null?Text("${moviesDetails["Plot"]}",
                textAlign: TextAlign.center,):const Text("Loading..."),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text("Year:", style: TextStyle(fontWeight: FontWeight.bold),),
                  moviesDetails != null?Text("${moviesDetails["Year"]}"):const Text("Loading..."),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text("Genre:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0), ),
                  moviesDetails != null?Text("${moviesDetails["Genre"]}"):const Text("Loading..."),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Text("RunTime:", style: TextStyle(fontWeight: FontWeight.bold),),
                moviesDetails != null?Text("${moviesDetails["Runtime"]}"):const Text("Loading..."),
              ],
            ),
          ],
      );
  }
}
