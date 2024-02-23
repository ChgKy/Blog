import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'click.dart';

class listview extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<listview> {
  int _currentIndex = 0;
  List<dynamic> Blog = [];

  void getdata() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/blog"));
    final value = jsonDecode(response.body);
    setState(() {
      Blog = value['blog'];
    });
  }

  @override
  void initState() {
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the arrow icon
        title: const Text(
          'View Of all Blog',
          style: TextStyle(
            color: Colors.yellow, // Set text color to white
            fontSize: 24, // Set font size
            fontWeight: FontWeight.bold, // Set font weight
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            if(Blog.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: Blog.length,
                itemBuilder: (context, index) {
                  // Build each ListTile with data from the blogData list
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 1, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ]
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlogDetailsPage(id: Blog[index]['blog_id']),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          child: Text(Blog[index]['blog_id'].toString()),
                        ),
                        title: Text(Blog[index]['title']),
                        subtitle: Text(Blog[index]['name']),
                        // You can customize the ListTile as per your requirement
                      ),

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
