import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/network/remote/api_manger.dart';
import '../../news_details/news_details.dart';
import '../back_ground_image/back_ground_image.dart';
import '../news_card/news_card.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(query.isEmpty){
          Navigator.of(context).pop();
        }else{
          query = "";
        }
      },
      icon: const Icon(Icons.cancel),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: ApiManger.getSearchData(searchKeyWord: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/image/Animation.json'),
            );
          }
          if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Center(
                  child: Lottie.asset('assets/image/Animation2.json'),
                )
              ],
            );
          }
          if (snapshot.hasData) {
            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(
                              articles: news[index],
                            ),
                          ),
                        );
                      },
                      child: NewsCard(articles: news[index]));
                },
                itemCount: news.length,
              ),
            );
          } else {
            return Center(
              child: Lottie.asset('assets/image/Animation.json'),
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return MyBackgroundImage(
        body: const Center(
          child: Text(
            "Suggestion",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      );
    } else {
      return MyBackgroundImage(
        body: FutureBuilder(
          future: ApiManger.getSearchData(searchKeyWord: query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset('assets/image/Animation.json'),
              );
            }
            if (snapshot.hasError || snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Center(
                    child: Lottie.asset('assets/image/Animation2.json'),
                  )
                ],
              );
            }
            if (snapshot.hasData) {
              var news = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(
                                articles: news[index],
                              ),
                            ),
                          );
                        },
                        child: NewsCard(articles: news[index]));
                  },
                  itemCount: news.length,
                ),
              );
            } else {
              return Center(
                child: Lottie.asset('assets/image/Animation.json'),
              );
            }
          },
        ),
      );
    }
  }
}
