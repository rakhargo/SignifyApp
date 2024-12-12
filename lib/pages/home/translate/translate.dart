import 'package:flutter/material.dart';
import '../../../components/bottom_bar.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/home.dart';

class Translate extends StatefulWidget {
  const Translate({super.key});

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Guide()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Translate()));
          break;
        case 3:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const History()));
          break;
        case 4:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Profile()));
          break;
      }
      setState(() {
        _selectedIndex = index; // Update index yang dipilih
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFC2E8FF),
              Color(0xFF6395B4),
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Translate',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0, // Hilangkan bayangan AppBar
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Expanded(
              child: Center(
                child: const Text(
                  'Ini Halaman Translate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
