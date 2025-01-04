import 'package:agrisense/screens/history.dart';
import 'package:agrisense/screens/homeScreenBody.dart';
import 'package:agrisense/screens/inputScreenDraft.dart';
import 'package:agrisense/screens/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body;

    switch (_selectedIndex) {
      case 0:
        body = HomeScreenBody1(); // Home
        break;
      case 1:
        body = HistoryScreen(); // History
        break;
      case 2:
        body = UserProfile(); // User
        break;
      default:
        body = Container(); // Handle other cases if needed
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Harvesta'),
        backgroundColor: Color(0xFF6d4c41), // Light brown for AppBar background
        leading: Image.asset(
          'assets/images/logologo.png',
          width: 30,
          height: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputForm1(),
                ),
              );
            },
          ),
        ],
      ),
      body: body,
      backgroundColor: Color(0xFF3e2723), // Dark brown background for the body
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3e2723), // Dark brown for BottomNavigationBar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFffcc80), // Peach color for selected item
        unselectedItemColor: Colors.white60, // Lighter color for unselected items
        onTap: (value) {
          if (value < 3) {
            setState(() {
              _selectedIndex = value;
            });
            print(_selectedIndex);
          }
        },
      ),
    );
  }
}
