import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  const Subject(
      {super.key,
      required this.image,
      required this.title,
      required this.color,});

  final String image;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: color,
          child: Column(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
