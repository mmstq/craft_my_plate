import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _controller = PageController(initialPage: 0);
  var onPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 5,
            child: PageView(
              controller: _controller,
              onPageChanged: (val) {
                onPage = val;
                setState(() {});
              },
              children: [
                page(
                    animationAsset: 'thinking',
                    title: "Exquisite Catering",
                    description:
                        "Experience culinary artistry like never before with our innovative and exquisite cuisine creations"),
                page(
                    animationAsset: 'Attendance.svg',
                    title: "DAILY ATTENDENCE",
                    description:
                        "Easily you can notice your child's attendence"),
                page(
                    animationAsset: 'Result.svg',
                    title: "EXAM RESULT",
                    description:
                        "Notice your children exams results and test results quickly"),
              ],
            ),
          ),
          DotsIndicator(

            dotsCount: 3,
            position: onPage,
            decorator: DotsDecorator(
              activeSize: const Size(18, 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.grey.withOpacity(0.4),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(40)
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
                child:
                const Icon(Icons.arrow_forward, color: Colors.white,)
                /*Text(onPage == 2 ? 'GET STARTED' : 'NEXT')*/
                /*onPressed: () {
                  if (onPage <= 1) {
                    onPage++;
                    setState(() {});
                  } else {}
                },*/
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget page(
    {required String animationAsset,
    required String title,
    required String description}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
          height: 500,
          child: RiveAnimation.asset(
            'assets/$animationAsset.riv',
            fit: BoxFit.cover,
          )),
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      )
    ],
  );
}
