import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/image1.png'),
      ),
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
                          color: Colors.pink.shade100,
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
                    title: Text('Notifications'),
                    leading: Icon(Icons.notifications),
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
                    leading: Icon(Icons.people_rounded),
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
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.pink.shade100,
          iconSize: 32,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                label: 'Home',
                backgroundColor: Colors.pink.shade100),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search_rounded),
                label: 'Search',
                backgroundColor: Colors.pink.shade100),
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                label: 'Home',
                backgroundColor: Colors.pink.shade100),
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                label: 'Home',
                backgroundColor: Colors.pink.shade100),
          ]),
    );
  }
}
