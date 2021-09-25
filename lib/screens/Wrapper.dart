import 'package:flutter/material.dart';
import 'package:food_hub/screens/Navigator.dart';
import 'package:food_hub/screens/authenticate/Authenticate.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = null;
    
    // return either the Home or Authenticate widget
    if (user == null){
      return BottomNavigator();
    } else {
      return Authenticate();
    }
    
  }
}