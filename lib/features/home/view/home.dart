import 'package:flutter/material.dart';
import 'package:news_mobile/features/home/view/dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      label: 'Home',
      tooltip: 'Home',
      icon: Icon(Icons.home_rounded),
      activeIcon: Icon(
        Icons.home_rounded,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Bookmark',
      tooltip: 'Bookmark',
      icon: Icon(Icons.bookmark_border),
      activeIcon: Icon(
        Icons.bookmark_border,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Notification',
      tooltip: 'Notification',
      icon: Icon(Icons.notifications_outlined),
      activeIcon: Icon(
        Icons.notifications_outlined,
        color: Colors.blue,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Profile',
      tooltip: 'Profile',
      icon: Icon(Icons.person_2_outlined),
      activeIcon: Icon(
        Icons.person_2_outlined,
        color: Colors.blue,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            DashBoard(),
            Scaffold(
              body: Center(
                child: Text(
                  'Bookmark',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text(
                  'Notification',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: items,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
