import 'package:flutter/material.dart';
import '../../../components/bottom_bar.dart';
import '../../../pages/home/translate/translate.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;

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
                'Riwayat',
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
                  'Ini Halaman Riwayat',
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
