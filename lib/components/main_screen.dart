import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_to_wealth/views/history_screen.dart';
import 'package:waste_to_wealth/views/home_screen.dart';
import 'package:waste_to_wealth/views/social_screen.dart';
import 'package:waste_to_wealth/views/profile_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    SocialScreen(),
   ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.green[900],
          indicatorColor: Colors.transparent,
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              return TextStyle(
                color: states.contains(MaterialState.selected)
                    ? const Color(0xFF51BB20) // Selected text color
                    : Colors.white, // Unselected text color
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
            },
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          destinations: [
            NavigationDestination(
              icon: SvgIcon('assets/icons/home.svg', 35),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgIcon('assets/icons/time.svg', 30),
              label: 'History',
            ),
            NavigationDestination(
              icon: SvgIcon('assets/icons/world.svg', 25),
              label: 'Social',
            ),
            NavigationDestination(
              icon: SvgIcon('assets/icons/person.svg', 30),
              label: 'Profile',
            ),
          ],
        ),
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
