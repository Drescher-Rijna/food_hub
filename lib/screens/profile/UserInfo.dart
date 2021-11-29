import 'package:flutter/material.dart';
import 'package:food_hub/models/User.dart';
import 'package:provider/provider.dart';

class  UserInfo extends StatefulWidget {

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {

    final UserData userData = Provider.of<UserData>(context) ?? [];
    //80% of screen width
    double c_width = MediaQuery.of(context).size.width*0.8;
    double btn_width = MediaQuery.of(context).size.width*0.9;

    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                //profile picture
                children: [
                  GestureDetector(
                    onLongPress: () {
                      print("pressing");
                    },
                    onLongPressUp: () {
                      print("released");
                    },

                    //profile picture
                    child: userData.profilePic == "" ?
                      Container(
                        padding: EdgeInsets.all(33.333),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          userData.username.toUpperCase().substring(0,2),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ), 
                        ),
                      ) :
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.network(userData.profilePic)
                      ),
                  ),
                ],
              ),

              Column(
                // number of posts
                children: [
                  Text(
                    userData.posts.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Posts",
                    style: TextStyle(
                      
                    ),
                  ),
                ],
              ),
              Column(
                // number of followers
                children: [
                  Text(
                    userData.followers.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(

                    ),
                  ),
                ],
              ),
              Column(
                // number of likes
                children: [
                  Text(
                    userData.following.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Following",
                    style: TextStyle(

                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              Text(
                userData.username,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.0,),
          Row(
            children: [
              Container (
              width: c_width,
              // profile description
              child: Text(
                  userData.description,
                  style: TextStyle(
                    
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          // edit profile button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: btn_width,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey[200], width: 1),
                  ),
                  child: Text(
                    "Edit profile",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}