import 'package:Akhbar/models/newsDataResponse.dart';
import 'package:Akhbar/screens/widgets/back_ground_image/back_ground_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsDetailsScreen extends StatelessWidget {
  Articles articles;

  NewsDetailsScreen({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return MyBackgroundImage(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Akhbar"),
        ),
        body: Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: articles.urlToImage!,
                  height: 180,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                          child: CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  articles.author ?? '',
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  articles.title ?? '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: Checkbox.width,
                ),
                Text(
                  articles.description ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 16),
                ),

                Text( _getFormatDate(articles.publishedAt),
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.black, fontSize: 12),),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFormatDate(String? date) {
    if(date == null) {
      return "";
    }
    DateTime dateTime = DateTime.parse(date);
    return timeago.format(dateTime);
  }
}
