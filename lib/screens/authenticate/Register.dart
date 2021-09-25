import 'package:flutter/material.dart';
import 'package:food_hub/services/auth.dart';
import 'package:food_hub/shared/Loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String username = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Create account',
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.grey[900],
            ),
            label: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.grey[900],
              ),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'username',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[700], width: 2.0),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => username = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[700], width: 2.0),
                      ),
                    ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'password',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[700], width: 2.0),
                      ),
                    ),
                    validator: (val) => val.length < 6 ? 'Enter a password +6 characters long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 25.0,),
                  ElevatedButton(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 16,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0, horizontal: 25.0)),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(username, email, password);
                        if (result == null) {
                          setState(() {
                              error = 'please supply a valid email';
                              loading = false;
                            }
                          );
                          
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}