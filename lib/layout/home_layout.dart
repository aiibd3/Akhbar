import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/widgets/subject.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String routeName = "homeScreen";

  final _controller = PageController();

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
  ];
  final List<String> title = [
    "Sports",
    "Politics",
    "Health",
    "business ",
    "Environment",
    "Science",
  ];
  final List<String> image = [
    "assets/image/Sports.png",
    "assets/image/bussines.png",
    "assets/image/Elections.png",
    "assets/image/Doctors.png",
    "assets/image/Tree.png",
    "assets/image/science.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/pattern.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xff42505C),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          title: Center(
            child: Text(
              "Akhbar",
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Pick your category of interest",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, SplashScreen.routeName);
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.7,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Subject(
                      title: title[index],
                      image: image[index],
                      color: colors[index],
                    );
                  },
                  itemCount: title.length,
                  controller: _controller,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: title.length,
              effect: SlideEffect(
                activeDotColor: Colors.black54,
                dotColor: Colors.grey.withOpacity(.5),
                dotHeight: 15,
                dotWidth: 15,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
