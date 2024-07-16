import 'package:flutter/material.dart';
import '../domain/types/colors_app.dart';
import 'service_list.dart';
import 'home.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';

class BottomBarController extends Controller {
  final PageController _pageController = PageController();
  final Notifier<int> _selectedIndex = Notifier(0);

  @override
  onInit() {}

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    _selectedIndex.value = index;
  }

  @override
  onClose() {}
}

class BottomBarView extends ViewOf<BottomBarController> {
  BottomBarView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return controller._selectedIndex.show(
      (value) => Scaffold(
        body: PageView(
          controller: controller._pageController,
          onPageChanged: controller._onPageChanged,
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
              icon: Icon(Icons.list),
              label: 'Serviços',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Empresas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: controller._selectedIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: controller._onItemTapped,
          unselectedItemColor: Colors.grey,
          backgroundColor: ColorApp().bottomBar, // Mude para a cor desejada
        ),
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
      child: Text('Pesquisa'),
    );
  }
}

// Página Profile
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favoritos'),
    );
  }
}

// Página Settings
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings'),
    );
  }
}
