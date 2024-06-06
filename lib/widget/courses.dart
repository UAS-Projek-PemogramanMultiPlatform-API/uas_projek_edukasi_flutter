import 'package:flutter/material.dart';
import 'package:projek_aplikasi_edukasi_uas/courses_detail.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  final List<String> imgList = const [
    'English',
    'Germany',
    'Italy',
    'Spain',
  ];

  final List<int> videoCounts = const [
    45, // English
    32, // Germany
    35, // Italy
    38, // Spain
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Kursus",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              final int index = entry.key;
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursesDetail(
                        img: imgList[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF5F3FF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "aset/images/${imgList[index]}.png",
                        width: 140,
                        height: 140,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        imgList[index],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${videoCounts[index]} Videos",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

