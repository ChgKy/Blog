import 'package:flutter/material.dart';
import 'signup.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();

  Color _borderColor_username = Colors.white;
  Color _borderColor_password = Colors.white;

  Color _labColor_username = Colors.black;
  Color _labColor_password = Colors.black;

  String username = "Username";
  String password = "password";

  String secret_username = "john";
  String secret_password = "john";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(
              color: Colors.yellow, // Set text color to white
              fontSize: 24, // Set font size
              fontWeight: FontWeight.bold, // Set font weight
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the left
              children: [
                SizedBox(height: 150),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Username/Email field with icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: Username,

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(color: _labColor_username),
                      labelText: username,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_username), // Use _borderColor
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Password field with eye icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: Password,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelStyle: TextStyle(color: _labColor_password),
                      labelText: password,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_password), // Use _borderColor
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      if(Username.text.isNotEmpty && Password.text.isNotEmpty){
                        if(Username.text != secret_username){
                          setState(() {
                            _borderColor_username = Colors.red;
                            username = "Wrong Username!";
                            _labColor_username = Colors.red;
                          });
                        } else {
                          setState(() {
                            _borderColor_username = Colors.white;
                            username = "Username";
                            _labColor_username = Colors.black;
                          });
                        }
                        if (Password.text != secret_password){
                          setState(() {
                            _borderColor_password = Colors.red;
                            password = "Wrong Password!";
                            _labColor_password = Colors.red;
                          });
                        } else {
                          setState(() {
                            _borderColor_password = Colors.white;
                            password = "Password";
                            _labColor_password = Colors.black;
                          });
                        }
                        if (Username.text == secret_username && Password.text == secret_password){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      } else if (Username.text.isEmpty && Password.text.isNotEmpty){
                        setState(() {
                          _borderColor_username = Colors.red;
                          username = "Field Can't not be empyty";
                          _labColor_username = Colors.red;
                        });
                      } else if(Username.text.isNotEmpty && Password.text.isEmpty){
                        setState(() {
                          _borderColor_password = Colors.red;
                          password = "Field Can't not be empyty";
                          _labColor_password = Colors.red;
                        });
                      }
                      else {
                        setState(() {
                          _borderColor_username = Colors.red;
                          _borderColor_password = Colors.red;

                          _labColor_username = Colors.red;
                          _labColor_password = Colors.red;

                          username = "Field Can't not be empyty";
                          password = "Field Can't not be empyty";
                        });
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
