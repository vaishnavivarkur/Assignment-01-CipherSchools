import 'package:flutter/material.dart';

class RecommendCourseList extends StatefulWidget {
  const RecommendCourseList({Key? key}) : super(key: key);

  @override
  State<RecommendCourseList> createState() => _RecommendCourseListState();
}

class _RecommendCourseListState extends State<RecommendCourseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 350,
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
