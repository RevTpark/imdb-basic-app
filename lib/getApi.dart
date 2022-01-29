import 'package:http/http.dart' as http;
import 'dart:convert' show json;

callAPI(var param, var title) async{
  var url = "http://www.omdbapi.com/?apikey=ca4430d&$param=" + title;
  final response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);
  if(param == "t"){
    return responseData["Search"];
  }
  else{
    return responseData;
  }
}