import 'dart:convert';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:m2_test/controllers/app_controller.dart';
import '../constants/end_point.dart';
import '../models/search_for_shows_model.dart';
import '../utils/data.dart';

class SearchController extends GetxController {
  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getSearchResult(pageKey);
    });
    super.onInit();
  }

  final AppController appController = Get.find();

  final _pageSize = 10;
  final PagingController<int, Search> pagingController =
      PagingController(firstPageKey: 1);
  RxList<Search> searchResult = <Search>[].obs;
  Rx<Future> futureSearchResult = Future.value().obs;

  Future getSearchResult(int pageKey) async {
    try {
      var response = await getData(formSearchForMovieUrl(pageKey));
      var showsListData = SearchForShowsModel.fromJson(jsonDecode(response));
      searchResult.value = showsListData.search ?? [];
      final isLastPage = searchResult.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(searchResult);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(searchResult, nextPageKey);
      }
      return futureSearchResult.value;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  String formSearchForMovieUrl(int pagenumber) {
    String addTitle = '&s=${appController.searchTextFieldController.text}';
    String? addYear = appController.showYear.value != ''
        ? '&y=${appController.selectedYear.value.year}'
        : '';
    String? addShowType = appController.selectedType.value != ShowType.none
        ? '&type=${appController.setShowTypeName(appController.selectedType.value)}'
        : '';
    var url =
        '${Constant.searchForMovie}$addTitle$addYear$addShowType&page=$pagenumber';
    return url;
  }
}
