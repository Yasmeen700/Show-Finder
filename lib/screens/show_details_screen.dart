import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m2_test/constants/app_colors.dart';
import '../controllers/app_controller.dart';

class ShowDetailsScreen extends StatelessWidget {
  ShowDetailsScreen({Key? key}) : super(key: key);
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.darkColor,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text(appController.showDetails.value.title ?? ''),
              expandedHeight: Get.width,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  appController.showDetails.value.poster != 'N/A'
                      ? appController.showDetails.value.poster ?? ''
                      : 'https://cdn-icons-png.flaticon.com/512/686/686461.png',
                  fit: BoxFit.fill,
                ),
              ),
              floating: true,
              pinned: true,
              snap: false,
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    appController.showDetails.value.plot ?? '',
                    style: const TextStyle(
                        fontSize: 16.0, color: Colors.white, letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Writer: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.writer ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Actors: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.actors ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Director: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.director ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Awards: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.awards ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Released Year: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.released ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Runtime: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.runtime ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Language: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.language ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Country: ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          appController.showDetails.value.country ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Source',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(color: AppColors.darkColor),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Value',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (appController.showDetails.value.ratings != null)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          appController.showDetails.value.ratings!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          appController.showDetails.value
                                                  .ratings?[index].source ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          appController.showDetails.value
                                                  .ratings?[index].value ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'IMBD',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    appController
                                            .showDetails.value.imdbRating ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
