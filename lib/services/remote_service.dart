import 'package:http/http.dart' as http;
import 'package:news_feed/models/news_model.dart';

class RemoteNewsService {
  static var client = http.Client();

  static Future<List<NewsArticle>?> fetchNewsArticle() async {
    var response = await client.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-04-30&sortBy=publishedAt&apiKey=67fb99b0351b4cd39ac8afdddc0d75f3"));

    if (response.statusCode == 200) {
      return newsArticleFromJson(response.body);
    } else {
      return null;
    }
  }
}
