import 'package:Akhbar/screens/new_tab/new_tab.dart';
import 'package:Akhbar/screens/widgets/back_ground_image/back_ground_image.dart';
import 'package:Akhbar/screens/widgets/home_body/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/widgets/subject.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static String routeName = "homeScreen";


  @override
  Widget build(BuildContext context) {
    return MyBackgroundImage(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Akhbar"),
        ),
        body: HomeBody(),
      ),
    );
  }
}
