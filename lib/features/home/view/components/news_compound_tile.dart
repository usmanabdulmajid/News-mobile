import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/extensions.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/home/view/news_detail.dart';

class NewsCompoundTile extends StatelessWidget {
  final News news;
  const NewsCompoundTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => NewsDetail(news: news)),
        );
      },
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(16),
                child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/237/200/300',
                  fit: BoxFit.cover,
                  width: 250,
                  height: 200,
                  placeholder: (context, url) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(16),
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
                        borderRadius: BorderRadiusDirectional.circular(16),
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
            ),
            const YMargin(8),
            const Text(
              'The latest on coronavirus has been and hassle',
              overflow: TextOverflow.fade,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
              softWrap: true,
            ),
            const YMargin(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    const XMargin(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Kim Sho-Hyun',
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          DateTime.now().toMonthDayYear,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dustyGrey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.athensGrey,
                  ),
                  child: const Icon(
                    Icons.edit_note,
                    color: AppColors.azureRadiance,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
