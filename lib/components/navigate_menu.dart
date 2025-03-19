import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_to_wealth/views/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0; // New: Keep track of the selected index

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const Text('History'),
    const Text('Social'),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // New: Current selected index
        onTap: _onItemTapped, // New: Handle tap to change index
        backgroundColor: Colors.green[900],
        selectedItemColor: const Color(0xFF51BB20), // Selected item color
        unselectedItemColor: Colors.white, // Unselected item color
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgIcon('assets/icons/home.svg', 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/icons/time.svg', 30),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/icons/world.svg', 25),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: SvgIcon('assets/icons/person.svg', 30),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class SvgIcon extends StatelessWidget {
  final String assetPath;
  final double size;

  const SvgIcon(this.assetPath, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: SvgPicture.asset(
        assetPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
