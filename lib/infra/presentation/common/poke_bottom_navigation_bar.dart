import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class PokeBottomNavigationBar extends StatefulWidget {
  const PokeBottomNavigationBar({super.key});

  @override
  State<PokeBottomNavigationBar> createState() =>
      _PokeBottomNavigationBarState();
}

class _PokeBottomNavigationBarState extends State<PokeBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.catching_pokemon),
      //       label: 'Pokemons',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.construction),
      //       label: 'Costume',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.red[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
