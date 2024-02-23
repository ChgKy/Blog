import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;

  Color _borderColor_firstname = Colors.white;
  Color _borderColor_lastname = Colors.white;
  Color _borderColor_email = Colors.white;
  Color _borderColor_password = Colors.white;

  String label_firstname = "firstname";
  String label_lastname = "lastname";
  String label_email = "email";
  String label_password = "password";


  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  void postUser(firstname, lastname, email, pass) async {
    var response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/signup"),
      body: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "pass": pass,
      },
    );
    print(response.body);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.yellow, // Set text color to white
              fontSize: 24, // Set font size
              fontWeight: FontWeight.bold, // Set font weight
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text to the left
              children: [
                SizedBox(height: 50),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // First Name field with icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: firstname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: label_firstname,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_firstname),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Last Name field with icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: label_lastname,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_lastname),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Email field with icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: label_email,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_email),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Password field with eye icon
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: pass,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: label_password,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: _borderColor_password),
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
                SizedBox(height: 10),

                // Confirm Password field with eye icon
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.grey[200],
                //   ),
                //   child: TextField(
                //     obscureText: !_isPasswordVisible,
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.lock),
                //       labelText: 'Confirm Password',
                //       border: InputBorder.none,
                //       contentPadding:
                //           EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //       suffixIcon: GestureDetector(
                //         onTap: () {
                //           setState(() {
                //             _isPasswordVisible = !_isPasswordVisible;
                //           });
                //         },
                //         child: Icon(
                //           _isPasswordVisible
                //               ? Icons.visibility
                //               : Icons.visibility_off,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(height: 20),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      if (firstname.text.isNotEmpty &&
                          lastname.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          pass.text.isNotEmpty) {
                        postUser(firstname.text, lastname.text, email.text, pass.text);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Congratulation'),
                              content: Text('Your Account have been Registor :)'),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      setState(() {
                        if (firstname.text.isEmpty) {
                          _borderColor_firstname = Colors.red;
                          label_firstname = "Must not be empty";
                        } else {
                          _borderColor_firstname = Colors.white;
                          label_firstname = "firstname";
                        }

                        if (lastname.text.isEmpty) {
                          _borderColor_lastname = Colors.red;
                          label_lastname = "Must not be empty";
                        } else {
                          _borderColor_lastname = Colors.white;
                          label_lastname = "lastname";
                        }

                        if (email.text.isEmpty) {
                          _borderColor_email = Colors.red;
                          label_email = "Must not be empty";
                        } else {
                          _borderColor_email = Colors.white;
                          label_email = "email";
                        }

                        if (pass.text.isEmpty) {
                          _borderColor_password = Colors.red;
                          label_password = "Must not be empty";
                        } else {
                          _borderColor_password = Colors.white;
                          label_password = "password";
                        }
                      });
                    },
                    child: Text(
                      'Sign Up',
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Already have an account? Log in",
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
