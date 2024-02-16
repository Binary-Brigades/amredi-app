import 'package:amredi/screens/edit_profile_page.dart';
import 'package:amredi/screens/home_screen.dart';
import 'package:amredi/screens/messages_screen.dart';
import 'package:amredi/screens/posts_screen.dart';
import 'package:amredi/screens/resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ResourceScreen(),
    const Posts(),
    const MessageScreen(),
    const ProfilePage()
  ];
  final List<Widget> _title = [
    Image.asset('images/image1.png'),
    const Text('Projects'),
    const Text('Posts'),
    const Text('Messages'),
    const Text('Profile')
  ];
  int _selectedIndex = 0;
  void changeTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final mybox = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: _title[_selectedIndex],
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/notifications');
              },
              icon: const Icon(Icons.notifications_outlined),
            ),
            IconButton(
              onPressed: () {
                mybox.delete("TOKEN");
                Navigator.of(context).pushReplacementNamed('/login');
              },
              icon: const Icon(Icons.logout_outlined),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0),
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.post_add_outlined,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/post');
          }),
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_rounded),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: 'messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ]),
    );
  }
}
