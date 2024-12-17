import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Clipboard
import 'package:signify/pages/home/dictionary/dictionary.dart';
import '../../../components/bottom_bar.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/home.dart';
import '../../../pages/home/translate/signTranslate.dart';

class TextTranslate extends StatefulWidget {
  const TextTranslate({super.key});

  @override
  State<TextTranslate> createState() => _TextTranslateState();
}

class _TextTranslateState extends State<TextTranslate> {
  final TextEditingController _textController =
      TextEditingController(); // Controller for input text
  final TextEditingController _translatedTextController =
      TextEditingController(); // Controller for translation result
  bool _isHoveringCopyInput = false; // For hover effect on copy input button
  bool _isHoveringCopyTranslation =
      false; // For hover effect on copy translation button
  bool _isHoveringPaste = false;
  bool _isTulisanFirst = true;
  bool _isHovering = false;
  bool _isHoveringTulisan = false;
  bool _isHoveringSwitch = false;
  bool _isHoveringIsyarat = false;

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

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

    // Paste text from clipboard
    void _pasteFromClipboard() async {
      final clipboardData = await Clipboard.getData('text/plain');
      if (clipboardData != null && clipboardData.text != null) {
        setState(() {
          _textController.text = clipboardData.text!; // Paste text to TextField
        });
      }
    }

    // Swap position and navigate to SignTranslate page
    void _swapAndNavigate() {
      setState(() {
        _isTulisanFirst = !_isTulisanFirst; // Swap position
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignTranslate()),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Terjemahkan Teks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Action for history icon
                          },
                          icon: const Icon(Icons.history,
                              size: 30), // History icon size
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert, size: 30),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 'settings', child: Text('Pengaturan')),
                            PopupMenuItem(
                                value: 'help', child: Text('Bantuan')),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'settings':
                                // Add settings page here
                                break;
                              case 'help':
                                // Add help page here
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                backgroundColor: Colors.transparent,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tulisan Penerjemah',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF052659)),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (_) =>
                                      setState(() => _isHoveringPaste = true),
                                  onExit: (_) =>
                                      setState(() => _isHoveringPaste = false),
                                  child: GestureDetector(
                                    onTap: _pasteFromClipboard,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Tempel',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: _isHoveringPaste
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Icon(
                                          Icons.paste,
                                          color: _isHoveringPaste
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (_) => setState(
                                      () => _isHoveringCopyInput = true),
                                  onExit: (_) => setState(
                                      () => _isHoveringCopyInput = false),
                                  child: GestureDetector(
                                    onTap: () =>
                                        _copyToClipboard(_textController.text),
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
                                        SizedBox(width: 12),
                                        Icon(
                                          Icons.copy,
                                          color: _isHoveringCopyInput
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12),
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
                            SizedBox(
                                height:
                                    20), // Jarak antara TextField dan Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF01A9F2), // Warna atas
                                        Color(0xFF172D9D), // Warna bawah
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: TextButton.icon(
                                    onPressed: () {
                                      // Fungsi untuk tombol "Terjemahkan"
                                    },
                                    icon: Icon(
                                      Icons.translate,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    label: Text(
                                      'Terjemahkan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      backgroundColor: Colors
                                          .transparent, // Transparan agar gradient terlihat
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12), // Sama dengan border gradient
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasil Terjemahan',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF052659)),
                        ),
                        SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    onEnter: (_) => setState(() =>
                                        _isHoveringCopyTranslation = true),
                                    onExit: (_) => setState(() =>
                                        _isHoveringCopyTranslation = false),
                                    child: GestureDetector(
                                      onTap: () => _copyToClipboard(
                                          _translatedTextController
                                              .text), // Copy from translation result
                                      child: Row(
                                        children: [
                                          Text(
                                            'Salin',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: _isHoveringCopyTranslation
                                                  ? Colors.blue
                                                  : Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Icon(
                                            Icons.copy,
                                            color: _isHoveringCopyTranslation
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          SizedBox(width: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 12),
                                child: TextField(
                                  controller: _translatedTextController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: 'Hasil Terjemah...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  readOnly: true, // Make it read-only
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Tampilkan "Tulisan" atau "Isyarat" tergantung pada posisi
                            _isTulisanFirst
                                ? _buildIsyaratButton()
                                : _buildTulisanButton(),

                            MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  _isHoveringSwitch = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  _isHoveringSwitch = false;
                                });
                              },
                              child: GestureDetector(
                                onTap:
                                    _swapAndNavigate, // Menangani klik pada ikon swap
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Row(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            colors: [
                                              _isHoveringSwitch
                                                  ? Colors.blue
                                                  : Color(0xFF01A9F2),
                                              _isHoveringSwitch
                                                  ? Colors.blue
                                                  : Color(0xFF172D9D),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ).createShader(bounds);
                                        },
                                        child: Icon(
                                          Icons.swap_horiz,
                                          size: 48, // Ukuran ikon 32 piksel
                                          color: Colors
                                              .white, // Warna ini tidak akan terlihat karena diganti gradien
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            _isTulisanFirst
                                ? _buildTulisanButton()
                                : _buildIsyaratButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
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

  Widget _buildTulisanButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveringTulisan = true),
      onExit: (_) => setState(() => _isHoveringTulisan = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHoveringTulisan ? Colors.blue : Color(0xFF052355),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Text(
              'Tulisan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 12),
            Icon(Icons.text_fields, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildIsyaratButton() {
    return GestureDetector(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHoveringIsyarat = true),
        onExit: (_) => setState(() => _isHoveringIsyarat = false),
        child: Container(
          decoration: BoxDecoration(
            color: _isHoveringIsyarat ? Colors.blue : Color(0xFF5381B2),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.pan_tool, color: Colors.white),
              SizedBox(width: 12),
              Text(
                'Isyarat',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
