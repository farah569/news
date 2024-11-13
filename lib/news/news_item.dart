import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmallStyle=Theme.of(context).textTheme.titleSmall;
    final fifteenAgo = DateTime.now();

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 , horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           ClipRRect(
            borderRadius:BorderRadius.circular(5),
             child: CachedNetworkImage(
              imageUrl: 
              'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
              height: MediaQuery.sizeOf(context).height*0.25,
              width: double.infinity,
              fit: BoxFit.fill,placeholder: (_,__)=>LoadingIndicator(),
              errorWidget: (_,__,___)=> 
              Icon(Icons.image_not_supported_outlined),
             ),
           ),
            SizedBox(height: 4),
            Text('BBC news',
            style: titleSmallStyle?.copyWith(
              fontSize: 10,
              color: AppTheme.grey,
            ),
            ),
            SizedBox(height: 4),
            Text(
              " why are football's biggest clubs starting a new tournment?",
              style: titleSmallStyle?.copyWith(
              fontWeight: FontWeight.w400,
            ),
            ),
            SizedBox(height: 2),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                timeago.format(fifteenAgo),
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