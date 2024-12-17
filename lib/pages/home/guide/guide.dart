import 'package:flutter/material.dart';
import 'package:signify/pages/home/guide/guide_detail.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/home.dart';
import '../../../components/unavailable.dart'; // Pastikan file unavailable.dart diimpor

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;

    // Daftar halaman
    final List<Widget> pages = [
      const Home(),
      const Guide(),
      const SignTranslate(),
      const History(),
      const Profile(),
    ];

    // Sample data for the cards
    final List<Map<String, dynamic>> cardData = [
      {'title': 'Panduan Aplikasi Signify', 'image': 'assets/images/image1.png', 'page': GuideDetail()},
      {'title': 'Panduan Memahami Bahasa Isyarat', 'image': 'assets/images/image2.png', 'page': Page2()},
      {'title': 'Panduan Penerjemahan', 'image': 'assets/images/image3.png', 'page': null}, // Page null for Card 3
      {'title': 'Panduan Aksesibilitas', 'image': 'assets/images/image4.png', 'page': Page4()},
      {'title': 'Tips dan Trik', 'image': 'assets/images/image5.png', 'page': Page5()},
    ];

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
                'Panduan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  bool _isHovering = false; // State for hover effect

                  return MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _isHovering = true; // Set hover state to true
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _isHovering = false; // Set hover state to false
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        // Gunakan switch case untuk menentukan card mana yang menampilkan unavailable()
                        switch (index) {
                          case 1: // Card kedua
                          case 2: // Card ketiga
                          case 3: // Card keempat
                          case 4: // Card kelima
                            unavailable(context); // Tampilkan unavailable untuk card tersebut
                            break;
                          default:
                            if (cardData[index]['page'] != null) {
                              // Navigasi ke halaman yang sesuai
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => cardData[index]['page']),
                              );
                            }
                            break;
                        }
                      },
                      child: Card(
                        color: _isHovering
                            ? Color(0xFF6FA6E0) // Darker color on hover
                            : Color(0xFF85B7FE), // Original color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4, // Drop shadow
                        margin: const EdgeInsets.all(12), // Margin around the card
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 6, // 60% of the space for the title
                                child: Text(
                                  cardData[index]['title']!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Set the text color to white
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 4, // 40% of the space for the image
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    cardData[index]['image']!,
                                    width: 80, // Set the width of the image
                                    height: 80, // Set the height of the image
                                    fit: BoxFit.cover, // Cover the space with the image
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index; // Update index yang dipilih
          });
        },
        pages: pages,
        disableActiveColor: true,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: Center(child: Text("Content for Page 2")),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 4")),
      body: Center(child: Text("Content for Page 4")),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 5")),
      body: Center(child: Text("Content for Page 5")),
    );
  }
}
