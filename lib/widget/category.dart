import 'package:flutter/material.dart';
import 'package:projek_aplikasi_edukasi_uas/kamus.dart';
import 'package:projek_aplikasi_edukasi_uas/quiz.dart';
import 'package:projek_aplikasi_edukasi_uas/forum_diskusi.dart';

class Category extends StatelessWidget {
  final String name;
  final Color color;
  final Icon? icon;

  const Category({
    required Key key,
    required this.name,
    required this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (name == 'Quiz') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizLanguageSelectionPage(),
            ),
          );
        } else if (name == 'Forum Diskusi') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForumDiscussionPage(),
            ),
          );
        } else if (name == 'Kamus') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KamusPage(),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10), // Adjust this value to move the icon
                child: icon ?? Container(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryData {
  static final List<String> catNames = [
    "Quiz",
    "Kamus",
    "Forum Diskusi",
  ];

  static final List<Color> catColors = [
    const Color(0xFFFFCF2F),
    const Color(0xFF61BDFD),
    const Color(0xFFCB84FB),
  ];

  static final List<Icon> catIcons = [
    const Icon(
      Icons.quiz_outlined,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.bookmark_border_outlined,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.forum_outlined,
      color: Colors.white,
      size: 30,
    ),
  ];
}
