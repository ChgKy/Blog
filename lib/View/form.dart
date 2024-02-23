import 'homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WriteBlogPage extends StatefulWidget {
  @override
  _WriteBlogPageState createState() => _WriteBlogPageState();
}

class _WriteBlogPageState extends State<WriteBlogPage> {
  int _currentIndex = 1; // Initial index for this tab
  TextEditingController firstname = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController about = TextEditingController();

  Color borderfirstname = Colors.white;
  Color borderAbout = Colors.white;
  Color borderTitle = Colors.white;

  String label_firstname = "Name of author";
  String label_title = "Title of Bog";
  String label_about = "Discription of Blog";



  void postBlog(title, firstname, about) async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/post"),
      body: {
        "title": title,
        "name": firstname,
        "about": about,
      },
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the arrow icon
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.yellow, // Set text color to white
            fontSize: 24, // Set font size
            fontWeight: FontWeight.bold, // Set font weight
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Placeholder for Title
            StyledTextField(labelText: label_title, controller: title, mycolor: borderTitle),
            SizedBox(height: 20),
            // Placeholder for Author Name
            StyledTextField(labelText: label_firstname, controller: firstname, mycolor: borderfirstname),
            SizedBox(height: 20),
            // Placeholder for Description
            StyledTextField(labelText: label_about, controller: about, maxLines: 5, mycolor: borderAbout),
          SizedBox(height: 20),

          // Submit Button
            Container(
              width: 50,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    if(firstname.text.isNotEmpty &&
                    title.text.isNotEmpty &&
                    about.text.isNotEmpty ){
                      postBlog(title.text, firstname.text, about.text);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Posted'),
                            content: Text('You have successfully Posted a Blog'),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    firstname.text = "";
                                    title.text = "";
                                    about.text = "";
                                  });
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    if(firstname.text.isEmpty){
                      borderfirstname = Colors.red;
                      label_firstname = "Can't be empty";
                    } else {
                      borderfirstname = Colors.white;
                      label_firstname = "Name of Author";
                    }

                    if(about.text.isEmpty){
                      borderAbout = Colors.red;
                      label_about = "Can't be empty";
                    } else {
                      borderAbout = Colors.white;
                      label_about = "Discription of Blog";
                    }

                    if(firstname.text.isEmpty){
                      borderTitle = Colors.red;
                      label_title = "Can't be empty";
                    } else {
                      borderTitle = Colors.white;
                      label_title = "Title of Blog";
                    }

                  });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StyledTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final int? maxLines;
  final Color? mycolor;

  StyledTextField({required this.labelText, this.controller, this.maxLines, this.mycolor});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: mycolor ?? Colors.green,
          ),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
