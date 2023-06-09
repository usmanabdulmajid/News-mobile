import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/extensions.dart';
import 'package:news_mobile/core/utils/logger.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/home/view/components/custom_textfield.dart';
import 'package:news_mobile/features/home/view/components/news_compound_tile.dart';
import 'package:news_mobile/features/home/view/components/news_tile.dart';
import 'package:news_mobile/features/home/view/news_detail.dart';
import 'package:news_mobile/features/home/viewmodel/news_notifier.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final container = ProviderContainer();
      container.read(newsProvider.notifier).news();
    });
  }

  final listOfCategory = [
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sport',
    'Technology',
    'Headlines',
  ];

  @override
  Widget build(BuildContext context) {
    final container = ProviderContainer();
    container.listen(newsProvider, (old, newstate) {
      logger.e('old state');
      logger.e(old);
      logger.e('new state');
      logger.e(newstate);
    });
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.athensGrey, AppColors.concrete],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blueGrey, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // child: const Placeholder(
                          //   fallbackHeight: 60,
                          //   fallbackWidth: 60,
                          // ),
                        ),
                        const XMargin(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              DateTime.now().toWeekDayDayMonth,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const YMargin(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomTextfield(
                      suffix: const Icon(Icons.search, color: Colors.white),
                      onChanged: (val) {},
                      hintText: 'Search for news...',
                    ),
                  ),
                  const YMargin(16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 40),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfCategory.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            logger.i(listOfCategory[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text(
                              '#${listOfCategory[index]}',
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final val = ref.watch(newsProvider);
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  padding:
                                      const EdgeInsets.only(left: 20, right: 5),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: val.news.length,
                                  itemBuilder: (context, index) {
                                    return NewsCompoundTile(
                                      news: val.news[index],
                                    );
                                  }),
                            ),
                            const YMargin(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Short For You',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      final container = ProviderContainer();
                                      await container
                                          .read(newsProvider.notifier)
                                          .news();
                                    },
                                    child: const Text(
                                      'View All',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const YMargin(10),
                            SizedBox(
                              height: 100,
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 5),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  NewsTile(news: News()),
                                  NewsTile(news: News()),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
