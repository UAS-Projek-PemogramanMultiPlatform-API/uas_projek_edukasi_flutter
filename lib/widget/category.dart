import 'package:flutter/material.dart';
import 'package:projek_aplikasi_edukasi_uas/quiz.dart'; 
import 'package:projek_aplikasi_edukasi_uas/forum_diskusi.dart'; 

class Category extends StatelessWidget {
  final String name;
  final Color color;
  final Icon? icon; // Make icon optional by adding '?'

  const Category({
    required Key key, // Change super.key to Key key
    required this.name,
    required this.color,
    this.icon, // Change Icon to Icon?
  }) : super(key: key); // Assign key to super

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (name == 'Quiz') { // Check if the category is Quiz
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizLanguageSelectionPage()), // Navigate to QuizLanguageSelectionPage
          );
        } else if (name == 'Forum Diskusi') { // Check if the category is Forum Diskusi
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForumDiscussionPage()), // Navigate to ForumDiskusiPage
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
              child: icon ?? Container(), // Handle null icon
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
    const Icon(Icons.quiz_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.bookmark_border_outlined, color: Colors.white, size: 30,),
    const Icon(Icons.forum_outlined, color: Colors.white, size: 30,),
  ];
}
