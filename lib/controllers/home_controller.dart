import 'package:flutter/cupertino.dart';
import 'package:game/models/recommendation.dart';
import 'package:game/network/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tournaments = [].obs;
  var scrollController = ScrollController(keepScrollOffset: true);

  var list = Future.value(<Tournament>[]).obs;

  var isLoading = true.obs;

  String cursor = '';

  @override
  onInit() {
    super.onInit();
    getRecommendations();
    addScrollListener();
  }

  addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        getMoreRecommendations();
      }
    });
  }

  getMoreRecommendations() async {
    try {
      isLoading(true);
      var recommendation = await Api.getMoreRecommendation(cursor);
      if (recommendation != null) {
        cursor = recommendation.data.cursor;
        tournaments.addAll(recommendation.data.tournaments);
      }
    } finally {
      isLoading(false);
    }
  }

  getRecommendations() async {
    try {
      isLoading(true);
      var recommendation = await Api.getRecommendations();
      if (recommendation != null) {
        cursor = recommendation.data.cursor;
        tournaments.assignAll(recommendation.data.tournaments);
      }
    } finally {
      isLoading(false);
    }
  }
}
