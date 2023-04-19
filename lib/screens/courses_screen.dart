//import 'package:cipherschools/components/lists/recommended_courses_list.dart';
//import 'package:cipherschools/components/navbar.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cipher Schools",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          const Text(
            "Recommended Courses",
            style: TextStyle(),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemCount: 10,
              itemBuilder: (context, index) {
                return buildCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(int index) => Container(
        color: Colors.blueAccent,
        width: 250,
        height: 350,
        child: Center(
          child: Text("$index"),
        ),
      );
}
