import 'package:flutter/material.dart';
import 'package:imdb_basic_project/main.dart';


class GetUserDetails extends StatefulWidget {
  const GetUserDetails({Key? key}) : super(key: key);

  @override
  _GetUserDetailsState createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails> {

  final _userNameController = TextEditingController();
  final _userDetailsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to IMDB app"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: _userNameController,
              decoration: const InputDecoration(labelText: "Enter Username"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              controller: _userDetailsController,
              decoration: const InputDecoration(labelText: "Enter User Details"),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomePage(_userNameController.text, _userDetailsController.text)
                ));
              },
              child: const Text("Next"))
        ],
      ),
    );
  }
}
