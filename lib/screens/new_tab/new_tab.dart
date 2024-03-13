import 'package:Akhbar/screens/widgets/back_ground_image/back_ground_image.dart';
import 'package:Akhbar/screens/widgets/tab_controller/tab_controller.dart';
import 'package:Akhbar/shared/network/remote/api_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NewsTab extends StatefulWidget {
  static const String routeName = 'Newstab';


  const NewsTab( {required this.title});
  final String title;



  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {

  @override
  Widget build(BuildContext context) {
    return MyBackgroundImage(
      body: Scaffold(
        appBar: AppBar(
          title: Text("Akhbar"),
      ),
        body: FutureBuilder(
            future: ApiManger.getSources(widget.title),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Lottie.asset('assets/image/Animation2.json'),
                );
              }
              if (snapshot.hasData) {
                var sources = snapshot.data?.sources ?? [];
                if(sources.isEmpty){
                  return Center(child: Text("empty"));
                }
                return TabControllerNav(sources);
              } else {
                return Center(
                  child: Lottie.asset('assets/image/Animation.json'),
                );
              }
            }),
      ),
    );
  }
}
