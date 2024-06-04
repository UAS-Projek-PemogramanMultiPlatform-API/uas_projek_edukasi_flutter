import 'package:flutter/material.dart';

class CoursesDetail extends StatefulWidget {
  final String img;
  final int videoCount;

  CoursesDetail({Key? key, required this.img, required this.videoCount})
      : super(key: key);

  @override
  State<CoursesDetail> createState() => _CoursesDetailState();
}

class _CoursesDetailState extends State<CoursesDetail> {
  bool isVideoSection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_rounded,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("aset/images/${widget.img}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xFF4CAF50),
                    size: 45,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Materi ${widget.img} Lengkap",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Materi dari pengajar",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7)),
            ),
            const SizedBox(height: 5),
            Text(
              "${widget.videoCount} Videos",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    // jika isVideoSection adalah true maka then warna tersebut menjadi on button dan jika kondisinya adalah false maka warna tersebut akan ditampilkan dengan opacity
                    color: isVideoSection
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        // perubahan pada value dari isVideoSection
                        setState(() {
                          isVideoSection = true;
                        });
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: const Text(
                          "Video",
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: !isVideoSection
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        // perubahan pada value dari isVideoSection
                        setState(() {
                          isVideoSection = false;
                        });},
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: const Text(
                          "Deskripsi",
                          style: TextStyle(
                            color: Color(0xFF4CAF50),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
