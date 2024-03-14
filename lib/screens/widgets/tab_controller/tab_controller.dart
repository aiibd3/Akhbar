import 'package:Akhbar/models/sourceResponse.dart';
import 'package:Akhbar/screens/news_details/news_details.dart';
import 'package:Akhbar/screens/widgets/news_card/news_card.dart';
import 'package:Akhbar/screens/widgets/tab_item/tab_item.dart';
import 'package:Akhbar/shared/network/remote/api_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class TabControllerNav extends StatefulWidget {
  List<Sources> sources;

  TabControllerNav(this.sources, {super.key});

  @override
  State<TabControllerNav> createState() => _TabControllerNavState();
}

class _TabControllerNavState extends State<TabControllerNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                  .map((source) => Tab(
                      child: TabItem(source,
                          widget.sources.indexOf(source) == selectedIndex)))
                  .toList(),
            ),),
        FutureBuilder(
            future: ApiManger.getNewsData(
                sourceId: widget.sources[selectedIndex].id ?? ""),
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
                                        ),),);
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
            })
      ],
    );
  }
}
