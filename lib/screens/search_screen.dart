import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:m2_test/constants/app_colors.dart';
import 'package:m2_test/controllers/app_controller.dart';
import 'package:m2_test/controllers/search_controller.dart';
import 'package:m2_test/screens/show_details_screen.dart';
import '../models/search_for_shows_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(SearchController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          title: Text(Get.arguments),
        ),
        body: Obx(
          () => FutureBuilder(
            future: searchController.futureSearchResult.value,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                log(searchController.searchResult.toString());
                return PagedGridView<int, Search>(
                  showNewPageProgressIndicatorAsGridChild: false,
                  showNewPageErrorIndicatorAsGridChild: false,
                  showNoMoreItemsIndicatorAsGridChild: false,
                  pagingController: searchController.pagingController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 100 / 150,
                    crossAxisCount: 2,
                  ),
                  builderDelegate: PagedChildBuilderDelegate<Search>(
                    itemBuilder: (context, item, index) => ShowCard(
                      searchResultShow: item,
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.none) {
                return Center(
                  child: Text(
                    "${snapshot.error}",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ShowCard extends StatelessWidget {
  final Search searchResultShow;

  ShowCard({Key? key, required this.searchResultShow}) : super(key: key);
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await appController
            .getSearchResultDetails(searchResultShow.imdbID ?? '');
        Get.to(
          () => ShowDetailsScreen(),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                searchResultShow.poster != 'N/A'
                    ? searchResultShow.poster ?? ''
                    : 'https://cdn-icons-png.flaticon.com/512/686/686461.png',
                width: Get.width,
                height: Get.width * 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              searchResultShow.title ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchResultShow.type ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                Text(
                  searchResultShow.year ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
