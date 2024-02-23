import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'click.dart';

class Edit_WriteBlogPage extends StatefulWidget {
  int? id = 0;
  Edit_WriteBlogPage({Key? key, required this.id}) : super(key: key);

  @override
  _WriteBlogPageState createState() => _WriteBlogPageState();
}

class _WriteBlogPageState extends State<Edit_WriteBlogPage> {
  int _currentIndex = 1; // Initial index for this tab
  TextEditingController firstname = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController about = TextEditingController();

  void getdata() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/blogedit/" + widget.id.toString()));
    final value = jsonDecode(response.body);
    print(value);
    setState(() {
      firstname.text =  value['blog']['name'];
      title.text = value['blog']['title'];
      about.text = value['blog']['about'];
    });
  }

  void initState() {
    super.initState();
    getdata();
  }

  void updateblog(title, firstname, about) async {
    var response_2 = await http.post(Uri.parse("http://10.0.2.2:8000/api/blogupdate/" + widget.id.toString()),
      body: {
        "title": title,
        "name": firstname,
        "about": about,
      },
    );
    final value_2 = jsonDecode(response_2.body);
    print(value_2["status"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            StyledTextField(labelText: 'The title of the blog', controller: title,),
            SizedBox(height: 20),
            // Placeholder for Author Name
            StyledTextField(labelText: 'Your Name', controller: firstname,),
            SizedBox(height: 20),
            // Placeholder for Description
            StyledTextField(labelText: 'What your blog is about', controller: about, maxLines: 5),
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
                    updateblog(title.text, firstname.text, about.text);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Saved'),
                          content: Text('Your Informatoion have been save!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => BlogDetailsPage(id: widget.id)),
                                );
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
                child: const Text(
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

  StyledTextField({required this.labelText, this.controller, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
