import 'package:Akhbar/models/newsDataResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage!,
            fit: BoxFit.cover,
            height: 180,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Center(
                    child: CircularProgressIndicator(
              color: Colors.blueGrey,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
/*
           Image.network(articles.urlToImage??""),
*/
          const SizedBox(
            height: Checkbox.width,
          ),
          Text(
            articles.author ?? '',
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          Text(
            articles.title ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
          ),
          Text( _getFormatDate(articles.publishedAt),
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.black, fontSize: 12),),
        ],
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
