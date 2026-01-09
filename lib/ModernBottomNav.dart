import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'SearchState.dart';
import 'ViewState.dart';
import 'TransferState.dart';
import 'SettingsState.dart';


class ModernBottomNavBar extends StatefulWidget {
  const ModernBottomNavBar({Key? key}) : super(key: key);

  @override
  _ModernBottomNavBarState createState() => _ModernBottomNavBarState();
}

class _ModernBottomNavBarState extends State<ModernBottomNavBar> {
  int _selectedIndex = 1;

  static const List<Gradient> _tabGradients = <Gradient>[
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff36096D),
        Color(0xff37D5D6)
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff5F0A87),
        Color(0xffA4508B)
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff6B0F1A),
        Color(0xffB91372),
      ],
    ),
    LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff28313B),
        Color(0xff485461)
      ],
    ),
  ];

  static const List<Widget> _pages = <Widget>[
    SearchState(),
    ViewState(),
    TransferState(),
    SettingsState(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              gap: 8,
              iconSize: 26,
              padding: const EdgeInsets.all(20),
              duration: const Duration(milliseconds: 400),
              //tabBackgroundColor: _tabColors[_selectedIndex],
              tabBackgroundGradient: _tabGradients[_selectedIndex],
              color: Colors.white12,
              activeColor: Colors.white54,
              tabs: const [
                GButton(
                    icon: Icons.search,
                    text: 'Search'
                ),
                GButton(
                    icon: Icons.home,
                    text: 'Mods'
                ),
                GButton(
                    icon: Icons.network_cell,
                    text: 'Transfer'
                ),
                GButton(
                    icon: Icons.settings,
                    text: 'Settings'
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}