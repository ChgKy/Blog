import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogDetailsPage extends StatefulWidget {
  int? id = 0;
  BlogDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  var Blog_detail = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/blogdetail/" + widget.id.toString()));
    final value = jsonDecode(response.body);
    setState(() {
      Blog_detail = value['blog'];
    });
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Blog_detail.isNotEmpty)
            Text(
              Blog_detail[0]['title'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (Blog_detail.isNotEmpty)
                          Text(
                            Blog_detail[0]['about'],
                            style: TextStyle(fontSize: 16),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (Blog_detail.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                  Text(
                    Blog_detail[0]['name'],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Edit button pressed
                    },
                    child: Text('Edit'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Delete button pressed
                    },
                    child: Text('Delete'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
