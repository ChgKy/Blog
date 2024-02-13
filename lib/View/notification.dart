import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
  ));
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _currentIndex = 2; // Index for the current page, set to 2 for notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
	    leading: BackButton(
   	    onPressed: () => Navigator.of(context).pop(),
      ),

        title: Text('Notifications'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NotificationItem(icon: Icons.notifications, text: 'Notification 1'),
            Divider(),
            NotificationItem(icon: Icons.notifications, text: 'Notification 2'),
            Divider(),
            NotificationItem(icon: Icons.notifications, text: 'Notification 3'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(), // Custom shape with a notch
        notchMargin: 8.0, // Adjust the size of the notch
        child: Container(
          height: 60.0, // Adjust the height of the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: _currentIndex == 0 ? Colors.white : Colors.grey),
                onPressed: () {
                  // Navigate to home page
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.edit, color: _currentIndex == 1 ? Colors.white : Colors.grey),
                onPressed: () {
                  // Navigate to edit page
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: _currentIndex == 2 ? Colors.white : Colors.grey),
                onPressed: () {
                  // Stay on notifications page
                  setState(() {
                    _currentIndex = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.person, color: _currentIndex == 3 ? Colors.white : Colors.grey),
                onPressed: () {
                  // Navigate to profile page
                  setState(() {
                    _currentIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const NotificationItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
