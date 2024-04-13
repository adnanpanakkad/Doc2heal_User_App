import 'package:flutter/material.dart';
import 'package:doc2heal/screens/chat_screen.dart';
import 'package:doc2heal/screens/home_screen.dart';
import 'package:doc2heal/screens/profile_screen.dart';
import 'package:doc2heal/screens/schedule_screen.dart';

class BottombarScreens extends StatefulWidget {
  const BottombarScreens({super.key});

  @override
  __BottombarScreensState createState() => __BottombarScreensState();
}

class __BottombarScreensState extends State<BottombarScreens> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
