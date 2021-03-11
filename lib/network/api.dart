import 'dart:convert';
import 'package:game/config/constants/network.dart';
import 'package:game/models/recommendation.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Recommendation> getRecommendations() async {
    var response = await http.get(Uri.parse(AppNetwork.base_url));
    if (response.statusCode == 200) {
      return Recommendation.fromJson(json.decode(response.body));
    }
    return null;
  }

  static getMoreRecommendation(String cursor) async {
    var response =
        await http.get(Uri.parse(AppNetwork.base_url + '&cursor=' + cursor));
    if (response.statusCode == 200) {
      return Recommendation.fromJson(json.decode(response.body));
    }
    return null;
  }
}
