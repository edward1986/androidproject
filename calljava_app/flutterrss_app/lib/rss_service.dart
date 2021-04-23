import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class RssService {
  final _targetUrl = 'https://edwardize.blogspot.com/feeds/posts/default';

  Future<AtomFeed> getFeed() =>
      http.read(_targetUrl).then((xmlString) => AtomFeed.parse(xmlString));
}