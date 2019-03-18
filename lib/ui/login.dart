import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
      }
      
    }
    
class LoginState extends State<Login> {

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _welcomeString = '';

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeString =_userController.text;
      } else {
        _welcomeString = ', name and pass are required.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent
      ),
      backgroundColor: Colors.blueGrey.shade400,

      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            //image icon
            Image.asset(
              'images/face.png',
              width: 85.0,
              height: 85.0,
              color: Colors.lightGreen[300],
            ),

            //form
            Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[

                  TextField(
                    controller: _userController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      icon: Icon(Icons.person)
                    ),
                  ),
                  
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      icon: Icon(Icons.lock_outline), 
                    ),
                    obscureText: true,
                  ),

                  Padding(padding: EdgeInsets.all(10.5)),
                  Center(
                    child: Row(
                      children: <Widget>[
                        // Login Button
                        Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.red[400],
                            child: Text('Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9
                                ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 130.0),
                          child: RaisedButton(
                            onPressed: _erase,
                            color: Colors.red[400],
                            child: Text('Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9
                                ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),

            Padding(padding: const EdgeInsets.all(20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Welcome $_welcomeString',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.5
                  ),
                ),
                 
              ],
            )


          ],
        ),
      ),
    );
  }

}