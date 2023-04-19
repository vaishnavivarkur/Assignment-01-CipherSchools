import 'package:cipherschools/screens/courses_screen.dart';
import 'package:cipherschools/screens/home_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final screens = const [
    Center(
      child: Text("home page"),
    ),
    CoursesScreen(),
    // Center(
    //   child: Text("courses page"),
    // ),
    Center(
      child: Text("trending page"),
    ),
    Center(
      child: Text("profile page"),
    ),
    // HomePage(),
    // CoursesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60,
          indicatorColor: Colors.orangeAccent,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          height: 60,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_filled),
              selectedIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.view_week_rounded),
              selectedIcon: Icon(Icons.view_week_rounded),
              label: "Courses",
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              selectedIcon: Icon(Icons.explore),
              label: "Trending",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
