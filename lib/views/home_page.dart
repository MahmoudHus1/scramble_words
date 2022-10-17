
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:scramble_words/views/play_screen.dart';
import 'package:scramble_words/views/settings_screen.dart';

import 'info_screen.dart';


void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _navScreens = <Widget>[
    const PlayPage(),
    const SettingsPage(),
    const InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 79, 11, 143),
        title: const Text('Scramble Words', style: TextStyle(color:  Color.fromRGBO(254, 194, 96, 1), fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: _navScreens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 79, 11, 143),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GNav(
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: const Color.fromARGB(255, 79, 11, 143), width: 1),
            tabBorder: Border.all(color: const Color.fromARGB(255, 79, 11, 143), width: 1),
            duration: const Duration(milliseconds: 600),
            backgroundColor: const Color.fromARGB(255, 79, 11, 143),
            color: const Color.fromRGBO(254, 194, 96, 1),
            tabBackgroundColor: const Color.fromARGB(158, 158, 49, 209),
            activeColor: const Color.fromRGBO(254, 194, 96, 1),
            padding: const EdgeInsets.all(10),
            gap: 10,
            tabs: const [
              GButton(icon: Icons.home, text: 'Play'),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
              GButton(
                icon: Icons.info,
                text: 'About Game',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
