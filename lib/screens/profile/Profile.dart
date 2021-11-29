import 'package:flutter/material.dart';
import 'package:food_hub/models/User.dart';
import 'package:food_hub/screens/profile/UserInfo.dart';
import 'package:food_hub/services/database.dart';
import 'package:food_hub/shared/Loading.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : MultiProvider(
      providers: [ 
        StreamProvider<UserData>.value(value: DatabaseService().users,),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.grey[900]),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              // Profile info with username, profile pic, stats
                UserInfo(),
              // toggleview between feed and saved/liked post
                // grid view builder
                  //post thumbnail/summary template
            ],
          ),
        ),
      ),
    );
  }
}