import 'package:cipherschools/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _current = 0;
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
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(
              height: 22,
            ),
            Text(
              "Welcome to",
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 15),
                ],
                color: Colors.black87,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "The Future",
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 15),
                ],
                color: Colors.orangeAccent,
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "of learning!",
              style: TextStyle(
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 15),
                ],
                color: Colors.black87,
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              "start learning by the best creators",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'for absolutely free!',
                  textStyle: const TextStyle(
                    color: Colors.orange,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 10,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 10,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 40,
                  ),
                  borderRadius: BorderRadius.circular(8), // <-- Radius
                ),
              ),
              child: const Text(
                "Start learning now --->",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Stack(
              children: [
                CarouselSlider(
                  items: [buildCard(), buildCard(), buildCard(), buildCard()],
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard() => Container(
        margin: const EdgeInsets.only(
          left: 5,
          top: 10,
          bottom: 10,
        ),
        height: MediaQuery.of(context).size.width * 0.4,
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
