import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:m2_test/constants/end_point.dart';
import 'package:m2_test/models/movie_details_model.dart';
import 'package:m2_test/models/search_for_shows_model.dart';
import 'package:m2_test/utils/data.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum ShowType { none, movie, series, episode }

class AppController extends GetxController{

  Rx<ShowType> selectedType = ShowType.none.obs;
  void onChangeShowType(ShowType? showType) {
    selectedType.value = showType!;
  }

  final TextEditingController searchTextFieldController = TextEditingController();
  final TextEditingController yearTextFieldController = TextEditingController();
  Rx<String> showYear = ''.obs;
  Rx<DateTime> selectedYear = DateTime.now().obs;

  Rx<ShowDetailsModel> showDetails = ShowDetailsModel().obs;

  Rx<Future> futureShowDetails = Future.value().obs;

  Future getSearchResultDetails(String showID) async {
    String url = '${Constant.searchForMovie}&plot=full&i=$showID';
    var response = await getData(url);
    var showDetailsData = ShowDetailsModel.fromJson(jsonDecode(response));
    showDetails.value = showDetailsData;
    log(showDetailsData.title.toString());
    return futureShowDetails.value;
  }

  String setShowTypeName(ShowType showType) {
    switch (showType) {
      case ShowType.movie:
        return 'Movie';
      case ShowType.series:
        return 'Series';
      case ShowType.episode:
        return 'Episode';
      case ShowType.none:
        return 'None';
    }
  }
}