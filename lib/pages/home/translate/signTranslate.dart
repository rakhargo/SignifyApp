import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart'; // Import paket camera
import 'package:signify/pages/home/dictionary/dictionary.dart'; 
import '../../../components/bottom_bar.dart';
import '../../../pages/home/profile/profile.dart';
import '../../../pages/home/guide/guide.dart';
import '../../../pages/home/history/history.dart';
import '../../../pages/home/home.dart';
import '../../../pages/home/translate/textTranslate.dart';

class SignTranslate extends StatefulWidget {
  const SignTranslate({super.key});

  @override
  State<SignTranslate> createState() => _SignTranslateState();
}

class _SignTranslateState extends State<SignTranslate> {
  final TextEditingController _textController = TextEditingController();
  bool _isHovering = false;
  bool _isHoveringTulisan = false;
  bool _isHoveringSwitch = false;
  bool _isHoveringIsyarat = false;
  bool _isTulisanFirst = true;
  int _selectedIndex = 2;

  // Variabel untuk kamera
  CameraController? _cameraController;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Inisialisasi kamera
  Future<void> _initializeCamera() async {
    // Dapatkan daftar kamera yang tersedia
    final cameras = await availableCameras();
    // Pilih kamera belakang
    final firstCamera = cameras.first;

    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _initializeControllerFuture = _cameraController!.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _textController.dispose();
    super.dispose();
  }

  // Daftar halaman
  final List<Widget> pages = [
    const Home(),
    const Dictionary(),
    const SignTranslate(),
    const History(),
    const Profile(),
  ];

  // Fungsi untuk menyalin teks ke clipboard
  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _textController.text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Teks disalin ke clipboard')),
      );
    });
  }

  // Fungsi untuk menukar posisi dan navigasi ke halaman textTranslate
  void _swapAndNavigate() {
    setState(() {
      _isTulisanFirst = !_isTulisanFirst;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TextTranslate()),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      'Terjemahkan Isyarat',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Aksi untuk ikon history
                          },
                          icon: const Icon(Icons.history, size: 30),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert, size: 30),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                                value: 'settings', child: Text('Pengaturan')),
                            const PopupMenuItem(
                                value: 'help', child: Text('Bantuan')),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'profile':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Profile()));
                                break;
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
                margin: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Kamera Penerjemah',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF052659)),
                      ),
                    ],
                  ),
                ),
              ),

              // Area Kamera Penerjemah
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6, // Sesuaikan tinggi sesuai kebutuhan
                child: _cameraController == null
                    ? const Center(child: CircularProgressIndicator())
                    : FutureBuilder<void>(
                        future: _initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return CameraPreview(_cameraController!);
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
              ),

              // Container untuk Hasil Penerjemah dengan border radius dan drop shadow
              Container(
                margin: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hasil Terjemahan',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF052659)),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    onEnter: (_) =>
                                        setState(() => _isHovering = true),
                                    onExit: (_) =>
                                        setState(() => _isHovering = false),
                                    child: GestureDetector(
                                      onTap: _copyToClipboard,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Salin',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: _isHovering
                                                  ? Colors.blue
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Icon(
                                            Icons.copy,
                                            color: _isHovering
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12), // Jarak antara Salin dan TextField
                                child: TextField(
                                  controller: _textController,
                                  maxLines: 5,
                                  decoration: const InputDecoration(
                                    hintText: 'Hasil Teksnya...',
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Button Switch Translate
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                onTap: _swapAndNavigate,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Row(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                            colors: [
                                              _isHoveringSwitch
                                                  ? Colors.blue
                                                  : const Color(0xFF01A9F2),
                                              _isHoveringSwitch
                                                  ? Colors.blue
                                                  : const Color(0xFF172D9D),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ).createShader(bounds);
                                        },
                                        child: const Icon(
                                          Icons.swap_horiz,
                                          size: 48,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        pages: pages,
      ),
    );
  }

  Widget _buildTulisanButton() {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveringTulisan = true),
      onExit: (_) => setState(() => _isHoveringTulisan = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHoveringTulisan ? Colors.blue : const Color(0xFF5381B2),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: const [
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHoveringIsyarat = true),
      onExit: (_) => setState(() => _isHoveringIsyarat = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isHoveringIsyarat ? Colors.blue : const Color(0xFF052355),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: const [
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
    );
  }
}
