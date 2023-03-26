import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m2_test/constants/app_colors.dart';
import 'package:m2_test/controllers/app_controller.dart';
import 'package:m2_test/screens/search_screen.dart';
import 'package:m2_test/widgets/search_bar.dart';
import 'package:m2_test/widgets/toast.dart';
import 'package:m2_test/widgets/year_picker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final AppController appController = Get.put(AppController(), permanent: true);
  static const List<String> images = [
    'assets/poster1.jpg',
    'assets/poster2.jpg',
    'assets/poster3.jpg',
    'assets/poster4.jpg',
    'assets/poster5.jpg',
    'assets/poster6.jpg',
  ];

  final List<Widget> imagesSliders = images
      .map(
        (item) => Container(
          margin: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              item,
              fit: BoxFit.fill,
              width: Get.width,
              height: Get.height * 0.25,
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkColor,
        appBar: AppBar(
          title: const Text('Show Finder'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.3,
                    enlargeCenterPage: true,
                  ),
                  items: imagesSliders),
              const SizedBox(
                height: 32,
              ),
              MySearchBar(
                searchTextFieldController:
                    appController.searchTextFieldController,
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Filter results by:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Type:',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      flex: 2,
                      child: DropdownButton(
                        key: GlobalKey(),
                        value: appController.selectedType.value,
                        hint: const Text('Select a show Type'),
                        underline: Container(
                          height: 3,
                          color: Colors.white,
                        ),
                        items: ShowType.values.map((ShowType showType) {
                          return DropdownMenuItem<ShowType>(
                            value: showType,
                            child: Text(
                              appController.setShowTypeName(showType),
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: appController.onChangeShowType,
                        icon: const Icon(
                          Icons.movie_filter_outlined,
                          color: Colors.white,
                          // color: primaryColor,
                        ),
                        dropdownColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      'Year:',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: YearPickerWidget(
                      selectedYear: appController.selectedYear,
                      showYear: appController.showYear,
                      yearTextController: appController.yearTextFieldController,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (appController.searchTextFieldController.text != '') {
                      Get.to(() => const SearchScreen(),
                          arguments:
                              appController.searchTextFieldController.text);
                    } else {
                      Toast().showToast(context, 'Please enter the show name.');
                    }
                  },
                  child: const Text("Search"),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(5.0),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 16.0)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 50.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
