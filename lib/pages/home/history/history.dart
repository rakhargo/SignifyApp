import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signify/pages/home/dictionary/dictionary.dart';
import '../../../components/bottom_bar.dart';
import '../translate/signTranslate.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // Define the text controller outside the build method
  final TextEditingController _textController = TextEditingController();
  int _selectedIndex = 3;
  bool _isHoveringPaste = false;
  bool _isHoveringCopyInput = false; // For hover effect on copy input button

  // Daftar halaman
  final List<Widget> pages = [
    const Home(),
    const Dictionary(),
    const SignTranslate(),
    const History(),
    const Profile(),
  ];

  // Copy text to clipboard
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Teks disalin ke clipboard')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Terjemahan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      PopupMenuButton(
                        icon: const Icon(Icons.more_vert, size: 30),
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'settings', child: Text('Pengaturan')),
                          PopupMenuItem(value: 'help', child: Text('Bantuan')),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'settings':
                              // Tambahkan halaman pengaturan di sini
                              break;
                            case 'help':
                              // Tambahkan halaman bantuan di sini
                              break;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Container(
              margin: const EdgeInsets.all(12), // Margin 12px
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20), // Padding 12px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hari ini',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // New Container for the "Salin" button and TextField
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color:
                          const Color(0xFFC2E8FF), // Background color #C2E8FF
                      borderRadius:
                          BorderRadius.circular(12), // Border radius 12px
                    ),
                    padding:
                        const EdgeInsets.all(12), // Padding for inner content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) =>
                              setState(() => _isHoveringCopyInput = true),
                          onExit: (_) =>
                              setState(() => _isHoveringCopyInput = false),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.end, // Align to the right
                            children: [
                              GestureDetector(
                                onTap: () => _copyToClipboard(
                                    _textController.text), // Copy from input
                                child: Row(
                                  children: [
                                    Text(
                                      'Salin',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: _isHoveringCopyInput
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Icon(
                                      Icons.copy,
                                      color: _isHoveringCopyInput
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // TextField for input
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: TextField(
                            controller: _textController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Hasil Teksnya...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
        pages: pages, // Kirim daftar halaman ke BottomBar
      ),
    );
  }
}
