import 'package:flutter/material.dart';

class GetUserDetailsPage extends StatefulWidget {
  final username;
  final userDetails;
  const GetUserDetailsPage( this.username, this.userDetails, {Key? key}) : super(key: key);

  @override
  _GetUserDetailsPageState createState() => _GetUserDetailsPageState(username, userDetails);
}

class _GetUserDetailsPageState extends State<GetUserDetailsPage> {
  final username;
  final userDetails;
  _GetUserDetailsPageState(this.username, this.userDetails);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
           ListTile(
            title: Text("${username != ""?username:"Default User"}", textAlign: TextAlign.center,),
            subtitle: Text("${userDetails != ""?userDetails:"User Details here"}", textAlign: TextAlign.center,),
          ),
          Container(
              height: 200.0,
              child: Image.asset(
                "images/download.png",
                fit: BoxFit.cover,
              ),
          ),
        ],
      ),
    );
  }
}
