import 'package:flutter/material.dart';
import 'package:food_hub/screens/create/Create_post.dart';
import 'package:food_hub/screens/home/Home.dart';
import 'package:food_hub/screens/profile/Profile.dart';

class BottomNavigator extends StatefulWidget {

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Create_Post(),
    Profile(),
  ];

  void onTapBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        
        body: _children[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            onTapBar(index);
          },
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.library_books,
                color: Colors.blue,
              
              ),
              icon: Icon(
                Icons.library_books_outlined,
                color: Colors.black,
              
              ),
              label: 'Recipies',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.add_box,
                color: Colors.blue,
              
              ),
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              
              ),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Colors.blue,
              
              ),
              icon: Icon(
                Icons.person_outline_outlined,
                color: Colors.black,
              
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}