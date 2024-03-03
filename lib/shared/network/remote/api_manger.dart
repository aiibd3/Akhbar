import 'dart:convert';

import 'package:Akhbar/models/sourceResponse.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  static Future<SourceResponse> getSources() async {
    var dio = Dio();
    var response = await dio.request(
      'https://newsapi.org/v2/top-headlines/sources?apiKey=9aa33ec98499401a9df00c68aa114696',
      options: Options(
        method: 'GET',
      ),
    );
    print("-------------");
    /*dio.Response response = await http.get(url);*/
    print("-------------");

/*
    var jsonData = jsonDecode(response.body);
*/
    SourceResponse sourceResponse = SourceResponse.fromJson(response.data);
    print("source responese:$SourceResponse");
    return sourceResponse;
  }
}
