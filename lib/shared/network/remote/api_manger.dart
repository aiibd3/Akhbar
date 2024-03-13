import 'dart:convert';

import 'package:Akhbar/models/newsDataResponse.dart';
import 'package:Akhbar/models/sourceResponse.dart';
import 'package:dio/dio.dart';

class ApiManger {
  static Future<SourceResponse> getSources(String category) async {
    var dio = Dio();
    var response = await dio.request(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=9aa33ec98499401a9df00c68aa114696&category=$category',
      options: Options(
        method: 'GET',
      ),
    );

    print("-------------");
    print(response.data);
    /*dio.Response response = await http.get(url);*/
    print("-------------");

/*
    var jsonData = jsonDecode(response.body);
*/
    SourceResponse sourceResponse = SourceResponse.fromJson(response.data);
    print("source responese:$SourceResponse");
    return sourceResponse;
  }
  static Future<NewsDataResponse> getNewsData(String sourceId) async {
    var dio = Dio();
    var response = await dio.request(
      'https://newsapi.org/v2/everything?apiKey=9aa33ec98499401a9df00c68aa114696&sources=$sourceId',
      options: Options(
        method: 'GET',
      ),
    );
    NewsDataResponse newsDataResponse=NewsDataResponse.fromJson(response.data);
    print(newsDataResponse);
    return newsDataResponse;
  }

}
