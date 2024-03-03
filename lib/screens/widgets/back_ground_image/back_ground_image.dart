import 'package:flutter/cupertino.dart';

class MyBackgroundImage extends StatelessWidget {
  Widget body;
  MyBackgroundImage( { required this.body});


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
      child: body,
    );
  }
}
