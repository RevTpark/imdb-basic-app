import 'package:flutter/material.dart';

class GetUserDetailsPage extends StatefulWidget {
  const GetUserDetailsPage({Key? key}) : super(key: key);

  @override
  _GetUserDetailsPageState createState() => _GetUserDetailsPageState();
}

class _GetUserDetailsPageState extends State<GetUserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          const ListTile(
            title: Text("User Name", textAlign: TextAlign.center,),
            subtitle: Text("User Details", textAlign: TextAlign.center,),
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
