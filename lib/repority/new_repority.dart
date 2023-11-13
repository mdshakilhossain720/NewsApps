import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/NewsModelChannel.dart';
class NewsReposity{
  Future<NewsModelChannel>NewsChannelHeadApi() async {
    String uri="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=c49345377af84be99ee227081932985f";
    final response=await http.get(Uri.parse(uri));

    if(response.statusCode==200){
      final body=jsonDecode(response.body);
          return NewsModelChannel.fromJson(body);
    }else{
      throw Exception("Error Message");

    }
  }

}