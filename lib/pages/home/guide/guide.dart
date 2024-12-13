import 'package:flutter/material.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/home.dart';
import '../../../components/unavailable.dart'; // Import the snackbar component

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;

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
            context,
            MaterialPageRoute(builder: (context) => const Guide()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignTranslate()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const History()),
          );
          break;
        case 4:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Profile()),
          );
          break;
      }
      setState(() {
        _selectedIndex = index;
      });
    }

    // Sample data for the cards
    final List<Map<String, dynamic>> cardData = [
      {'title': 'Panduan Aplikasi Signify', 'image': 'assets/images/image1.png', 'page': Page1()},
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
                        // Show snackbar for Card 3
                        if (index == 2) {
                          unavailable(context);
                        } else if (cardData[index]['page'] != null) {
                          // Navigate to the respective page if not Card 3
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => cardData[index]['page']),
                          );
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
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Example target pages
class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Center(child: Text("Content for Page 1")),
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
