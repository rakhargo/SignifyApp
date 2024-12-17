// bottom_bar.dart

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<Widget> pages;
  final bool disableActiveColor; // Parameter baru

  const BottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.pages,
    this.disableActiveColor = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF042558),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Kamus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.translate_rounded),
            label: 'Mulai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: disableActiveColor ? Colors.white : Colors.blue, // Tidak aktif jika disableActiveColor
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index >= 0 && index < pages.length) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => pages[index]),
            );
          }
          onItemTapped(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
