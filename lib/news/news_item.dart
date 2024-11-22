import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/news_response/news.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(
    this.news,{
    super.key,
    });

    final News news;
  @override
  Widget build(BuildContext context) {
    final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;
    //final fifteenAgo = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl:news.urlToImage??
                  'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (_, __) => LoadingIndicator(),
              errorWidget: (_, __, ___) =>
                  Icon(Icons.image_not_supported_outlined),
            ),
          ),
          SizedBox(height: 4),
          Text(
            news.source?.name??'',
            style: titleSmallStyle?.copyWith(
              fontSize: 10,
              color: AppTheme.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            news.title?? '',
            style: titleSmallStyle?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              timeago.format(news.publishedAt!),
              style: titleSmallStyle?.copyWith(
                fontSize: 13,
                color: AppTheme.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
