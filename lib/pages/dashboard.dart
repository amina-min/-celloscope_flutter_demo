import 'package:flutter/material.dart';
import 'package:flutterapp/model/users.dart';

class Dashboard extends StatelessWidget {
  final Users users;

  Dashboard(this.users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/allen-nelson-asset.jpg'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[600],
            ),
            Text(
              'Thank you',
              style: const TextStyle(
                  fontSize: 42.0,
                  color: Colors.grey,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Name: ${users.name}",
                style: TextStyle(fontSize: 22, letterSpacing: 1,
                  color: Colors.grey,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Date Of Birth: ${users.date_of_birth}",
                  style: TextStyle(fontSize: 22,
                    color: Colors.grey,)),
            )
          ],
        ),
      ),
    );
  }
}
