import 'package:amredi/screens/home_screen.dart';
import 'package:amredi/screens/messages_screen.dart';
import 'package:amredi/screens/notifications.dart';
import 'package:amredi/screens/resources_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ResourceScreen(),
    const MessageScreen(),
    const NotificationScreen()
  ];
  final List<Widget> _title = [
    Image.asset('images/image1.png'),
    const Text('Resources'),
    const Text('Messages'),
    const Text('Notifications')
  ];
  int _selectedIndex = 0;
  void changeTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _title[_selectedIndex],
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.circular(40))),
                  ListTile(
                    title: const Text('Profile'),
                    leading: const Icon(Icons.person_rounded),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/profile');
                    },
                  ),
                  const ListTile(
                    title: Text('Resources'),
                    leading: Icon(Icons.folder_copy_rounded),
                  ),
                  const ListTile(
                    title: Text('Community'),
                    leading: Icon(Icons.people_rounded),
                  ),
                  const ListTile(
                    title: Text('Support'),
                    leading: Icon(Icons.info_outline),
                  ),
                  const ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width,
                    elevation: 0,
                    height: 46,
                    color: Colors.pinkAccent.shade100,
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: changeTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.pinkAccent.shade100,
          iconSize: 32,
          selectedItemColor: Colors.pink,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_copy_rounded),
                label: 'Resources',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: 'messages',
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
                label: 'Notifications',
                ),
          ]),
    );
  }
}
