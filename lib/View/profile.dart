import 'homepage.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'main.dart';
import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This line removes the arrow icon
        title: const Text(
          'Profile',
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/assets/default.png',
              width: 150,
              height: 150,
            ),
            Text(
              'Chhorng',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            StyledInformationBox(
              child: InformationRow(label: 'Full Name', value: 'Chhorng Ky'),
            ),
            SizedBox(height: 10),
            StyledInformationBox(
              child:
                  InformationRow(label: 'Email', value: 'chhorngky@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}

class StyledInformationBox extends StatelessWidget {
  final Widget child;

  StyledInformationBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: child,
    );
  }
}

class InformationRow extends StatelessWidget {
  final String label;
  final String value;

  InformationRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
