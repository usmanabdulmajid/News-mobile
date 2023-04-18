import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/extensions.dart';
import 'package:news_mobile/core/utils/sizing.dart';

class NewsDetail extends StatelessWidget {
  final News news;
  const NewsDetail({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 32, right: 20, left: 20),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: const Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                        const Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const YMargin(24),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadiusDirectional.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: 'https://picsum.photos/id/237/200/300',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              placeholder: (context, url) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(16),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blueGrey, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(16),
                                    gradient: const LinearGradient(
                                      colors: [Colors.blueGrey, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const YMargin(8),
                          const Text(
                            '#Health',
                            style: TextStyle(
                              color: AppColors.azureRadiance,
                            ),
                          ),
                          const YMargin(16),
                          const Text(
                            'The latest on the coronavirus pandemic and the omicron viaraint ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const YMargin(10),
                        ],
                      ),
                    ),
                    const YMargin(20),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadiusDirectional.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                children: [
                                  CircleAvatar(),
                                  XMargin(8),
                                  Text(
                                    'Kim Soo-Hyun',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                DateTime.now().toWeekDayAbbrMonthAbbrDayYear,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const YMargin(20),
                          Text(
                            'hhhhhhhhhhhhhhhhhhhhhhhhh jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                            style: TextStyle(
                              height: 2.0,
                              fontSize: 16,
                            ),
                          ),
                          const YMargin(20),
                        ],
                      ),
                    ),
                    const YMargin(10),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.athensGrey,
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: AlignmentDirectional.center,
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsetsDirectional.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.azureRadiance,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
