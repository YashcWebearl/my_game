import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _launchGame(String url) async {
    final uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to open link: $e')),
      // );
      print('object:-$e');
    }
  }

  // Future<void> _launchGame(String url) async {
  //   final uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4B0082), // Indigo
              Color(0xFF1E1E4B), // Darker purple-blue
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'WiFi GAMES',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGameTile(
                    context,
                    image: 'assets/icon/dash.png',
                    title: 'DASH',
                    url: 'https://yashcwebearl.github.io/Flappy/',
                  ),
                  _buildGameTile(
                    context,
                    image: 'assets/icon/icon.png',
                    title: 'WORD PUZZLE',
                    url: 'https://yashcwebearl.github.io/wordpuzzle/',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildGameTile(
                    context,
                    image: 'assets/icon/tic_tac.png',
                    title: 'Tic Tac Toe',
                    url: 'https://yashcwebearl.github.io/tic_tac_toe/',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameTile(
      BuildContext context, {
        required String image,
        required String title,
        required String url,
      }) {
    return GestureDetector(
      onTap: () => _launchGame(url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF602EA6),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   Future<void> _launchGame(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[900],
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // SizedBox(height: 50),
//             const Text(
//               'WiFi GAMES',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 70),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildGameTile(
//                   context,
//                   image: 'assets/icon/dash.png',
//                   title: 'DASH',
//                   // subtitle: 'FLAPPY STYLE',
//                   url: 'https://yashcwebearl.github.io/Flappy/',
//                 ),
//                 _buildGameTile(
//                   context,
//                   image: 'assets/icon/icon.png',
//                   title: 'WORD PUZZLE',
//                   // subtitle: 'BRAIN GAME',
//                   url: 'https://yashcwebearl.github.io/wordpuzzle/',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildGameTile(BuildContext context,
//   //     {required String image,
//   //       required String title,
//   //       required String subtitle,
//   //       required String url}) {
//   //   return GestureDetector(
//   //     onTap: () => _launchGame(url),
//   //     child: Container(
//   //       width: 140,
//   //       padding: const EdgeInsets.all(10),
//   //       decoration: BoxDecoration(
//   //         color: Colors.white,
//   //         borderRadius: BorderRadius.circular(12),
//   //       ),
//   //       child: Column(
//   //         children: [
//   //           Image.asset(image, height: 80),
//   //           const SizedBox(height: 10),
//   //           Text(
//   //             title,
//   //             style: const TextStyle(
//   //               fontWeight: FontWeight.bold,
//   //               fontSize: 16,
//   //             ),
//   //           ),
//   //           Text(
//   //             subtitle,
//   //             style: const TextStyle(fontSize: 12, color: Colors.grey),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildGameTile(
//       BuildContext context, {
//         required String image,
//         required String title,
//         required String url,
//       }) {
//     return GestureDetector(
//       onTap: () => _launchGame(url),
//       child: Container(
//         width: 120,
//         height: 150,
//         decoration: BoxDecoration(
//           color: const Color(0xFF602EA6), // Deep purple background
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 110,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.white, // Green background like in the image
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//               ),
//               child: Center(
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit.contain,
//                   height: 80, // Adjust image size to fit naturally
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//                 letterSpacing: 1.2, // Add slight spacing for better readability
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
