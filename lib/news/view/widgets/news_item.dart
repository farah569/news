// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:news/shared/widgets/app_theme.dart';
// import 'package:news/news/data/models/news.dart';
// import 'package:news/shared/widgets/loading_indicator.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class NewsItem extends StatelessWidget {
//   const NewsItem(
//     this.news,{
//     super.key,
//     });

//     final News news;
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(5),
//             child: CachedNetworkImage(
//               imageUrl:news.urlToImage??
//                   'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
//               height: MediaQuery.sizeOf(context).height * 0.25,
//               width: double.infinity,
//               fit: BoxFit.fill,
//               placeholder: (_, __) => LoadingIndicator(),
//               errorWidget: (_, __, ___) =>
//                   Icon(Icons.image_not_supported_outlined),
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             news.source?.name??'',
//             style: titleSmallStyle?.copyWith(
//               fontSize: 10,
//               color: AppTheme.grey,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             news.title?? '',
//             style: titleSmallStyle?.copyWith(
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 2),
//           Align(
//             alignment: AlignmentDirectional.bottomEnd,
//             child: Text(
//               timeago.format(news.publishedAt!),
//               style: titleSmallStyle?.copyWith(
//                 fontSize: 13,
//                 color: AppTheme.grey,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/widgets/app_theme.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/widgets/loading_indicator.dart';
import 'package:news/news/view/news_details.dart'; // Import NewsDetails
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(
    this.news, {
    super.key,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return GestureDetector(
      onTap: () {
        // Navigate to the NewsDetails page with the selected news item
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(news: news),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ??
                    'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (_, __) => const LoadingIndicator(),
                errorWidget: (_, __, ___) =>
                    const Icon(Icons.image_not_supported_outlined),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              news.source?.name ?? '',
              style: titleSmallStyle?.copyWith(
                fontSize: 10,
                color: AppTheme.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              news.title ?? '',
              style: titleSmallStyle?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 2),
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
      ),
    );
  }
}
