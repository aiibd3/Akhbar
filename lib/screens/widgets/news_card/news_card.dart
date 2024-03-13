




import 'package:Akhbar/models/newsDataResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsCard extends StatelessWidget {
  Articles articles;
  NewsCard( { required this.articles});


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage!,
            height: 180,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(color: Colors.blueGrey,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
/*
           Image.network(articles.urlToImage??""),
*/
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
    );
  }
}
