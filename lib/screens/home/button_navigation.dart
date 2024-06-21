import 'package:flutter/material.dart';

import '../../domain/types/colors_app.dart';
import '../src/service_list.dart';
import 'home.dart';

class ScreenHome extends StatefulWidget {
  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          HomeView(
            controller: HomeController(),
          ),
          ServicesListView(
            controller: ServicesListController(),
          ),
          NotificationsPage(),
          ProfilePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Serviços',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

        unselectedItemColor: Colors.grey,
        backgroundColor: ColorApp().bottomBar, // Mude para a cor desejada
      ),
    );
  }
}

// Página Home
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

// Página Search
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Search Page'),
//     );
//   }
// }

// Página Notifications
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications Page'),
    );
  }
}

// Página Profile
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}

// Página Settings
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Page'),
    );
  }
}
