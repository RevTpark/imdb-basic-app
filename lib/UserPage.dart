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
            title: Text("User Name"),
            subtitle: Text("User Details"),
          ),
          Container(
            child: Ink.image(
                image: const NetworkImage("https://m.media-amazon.com/images/M/MV5BMjEwMzMxODIzOV5BMl5BanBnXkFtZTgwNzg3OTAzMDI@._V1_SX300.jpg"),
                fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
