import 'package:flutter/material.dart';
import 'form.dart';
import 'profile.dart';
import 'Listview.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Blog',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final page = [
    homepage(),
    WriteBlogPage(),
    listview(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.yellow,
        currentIndex: _currentIndex,
        iconSize: 40,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 35),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Add your profile navigation logic here
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Add your settings navigation logic here
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 40,
                        backgroundImage: AssetImage('lib/assets/default.png'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Chhorng Ky',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Featured Blogs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeaturedBlogBox(
                          imagePath:
                              'https://cdn4.vectorstock.com/i/1000x1000/20/38/hand-making-small-heart-sign-vector-28932038.jpg',
                          title: 'Blog 2'),
                      FeaturedBlogBox(
                          imagePath:
                              'https://cdn4.vectorstock.com/i/1000x1000/20/38/hand-making-small-heart-sign-vector-28932038.jpg',
                          title: 'Blog 2'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeaturedBlogBox(
                          imagePath:
                              'https://cdn4.vectorstock.com/i/1000x1000/20/38/hand-making-small-heart-sign-vector-28932038.jpg',
                          title: 'Blog 3'),
                      FeaturedBlogBox(
                          imagePath:
                              'https://cdn4.vectorstock.com/i/1000x1000/20/38/hand-making-small-heart-sign-vector-28932038.jpg',
                          title: 'Blog 4'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FeaturedBlogBox extends StatelessWidget {
  final String imagePath;
  final String title;

  FeaturedBlogBox({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
