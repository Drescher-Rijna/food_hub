import 'package:flutter/material.dart';
import 'package:food_hub/models/User.dart';
import 'package:food_hub/screens/Navigator.dart';
import 'package:food_hub/screens/authenticate/Authenticate.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return BottomNavigator();
      
    }
    
  }
}