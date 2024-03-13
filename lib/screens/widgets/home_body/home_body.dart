
import 'package:Akhbar/screens/new_tab/new_tab.dart';
import 'package:Akhbar/screens/widgets/back_ground_image/back_ground_image.dart';
import 'package:Akhbar/screens/widgets/subject.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeBody extends StatelessWidget {

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
  ];
  final List<String> title = [
    "sports",
    "Politics",
    "health",
    "business",
    "entertainment",
    "science",
  ];
  final List<String> image = [
    "assets/image/Sports.png",
    "assets/image/bussines.png",
    "assets/image/Elections.png",
    "assets/image/Doctors.png",
    "assets/image/Tree.png",
    "assets/image/science.png",
  ];
  final _controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.7,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsTab(title: title[index],)));
                },
                child: Subject(
                  title: title[index],
                  image: image[index],
                  color: colors[index],
                ),
              );
            },
            itemCount: title.length,
            controller: _controller,
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
    );
  }
}
