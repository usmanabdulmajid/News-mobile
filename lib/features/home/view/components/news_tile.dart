import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/model/news.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';
import 'package:news_mobile/features/home/view/news_detail.dart';

class NewsTile extends StatelessWidget {
  final News news;
  const NewsTile({Key? key, required this.news}) : super(key: key);

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
        width: 230,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(16),
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/id/237/200/300',
                fit: BoxFit.cover,
                width: 80,
                height: 80,
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
            const XMargin(8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bankidj jnjnsdijjjjjjjjjjjjjjjjjjjj',
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  YMargin(8),
                  Icon(
                    Icons.visibility_outlined,
                    size: 16,
                    color: AppColors.dustyGrey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
