


import 'package:Akhbar/models/newsDataResponse.dart';
import 'package:Akhbar/screens/widgets/back_ground_image/back_ground_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsDetailsScreen extends StatelessWidget {
  Articles articles;
  NewsDetailsScreen( { required this.articles});

  @override
  Widget build(BuildContext context) {
    return MyBackgroundImage(
      body: Scaffold(
        appBar: AppBar(
          title: Text("Akhbar"),
        ),
        body: Expanded(
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: articles.urlToImage!,
                  height: 180,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(color: Colors.blueGrey,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 10,),
                Text(articles.author??'',style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                ),),
                Text(articles.title??'',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),),
                Text(articles.publishedAt?.substring(0,12)??'',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12
                    )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
