
import 'package:mynewapps/model/NewsModelChannel.dart';

import '../repority/new_repority.dart';

class ViewModel{
  final rep= NewsReposity();
  Future<NewsModelChannel>NewsChannelHeadApi() async {
    final response=await rep.NewsChannelHeadApi();
    return response;
  }
}