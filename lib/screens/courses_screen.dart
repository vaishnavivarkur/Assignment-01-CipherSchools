import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cipherschools/constants.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/banner.png'},
    {"id": 2, "image_path": 'assets/images/banner.png'},
    {"id": 3, "image_path": 'assets/images/banner.png'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cipher Schools",
          style: kTitleTextStyle,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Colors.red
                                : Colors.teal),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "Recommended Courses",
              style: kTitleTextStyle,
            ),
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
                return buildCard();
              },
            ),
          ),
          const Text(
            "Latest Videos",
            style: kTitleTextStyle,
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
                return buildCard();
              },
            ),
          ),
          const Text(
            "Popular categories",
            style: kTitleTextStyle,
          ),
          SizedBox(
            height: 180,
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
                return buildCard();
              },
            ),
          ),
          const Text(
            "All courses",
            style: kTitleTextStyle,
          ),
          GridView.count(
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            padding: const EdgeInsets.all(15),
            crossAxisCount: 2,
            physics:
                const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true, // You won't see infinite size error
            children: <Widget>[
              buildCard(),
              buildCard(),
              buildCard(),
              buildCard(),
              buildCard(),
              buildCard(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCard() => Container(
        margin: const EdgeInsets.only(
          left: 5,
          top: 10,
          bottom: 10,
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Colors.white60,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueAccent,
        ),
      );
}
