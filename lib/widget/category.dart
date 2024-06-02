import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final Color color;
  final Icon icon;

  const Category({
    super.key,

    required this.name,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: icon,
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
        )
      ],
    );
  }
}

class CategoryData {
  static final List<String> catNames = [
    "Quiz",
    "Ebook",
    "Kamus",
    "Materi Video",
    "Forum Diskusi",
    "LeaderBoard"
  ];

  static final List<Color> catColors = [
    const Color(0xFFFFCF2F),
    const Color(0xFF6FE08D),
    const Color(0xFF61BDFD),
    const Color(0xFFFC7F7F),
    const Color(0xFFCB84FB),
    const Color(0xFF78E667),
  ];

  static final List<Icon> catIcons = [
    const Icon(Icons.quiz_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.book_online_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.bookmark_border_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.video_collection_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.forum_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.leaderboard_outlined, color: Colors.white, size: 30,),
  ];
}

