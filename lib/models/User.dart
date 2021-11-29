class MyUser {

  final String uid;
  
  MyUser({ this.uid });

}

class UserData {

  final String uid;
  final String username;
  final String profilePic;
  final int followers;
  final int following;
  final int posts;
  final String description;

  UserData({ this.uid, this.username, this.profilePic, this.followers, this.following, this.posts, this.description });

}