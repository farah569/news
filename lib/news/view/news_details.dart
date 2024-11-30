
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news/news/data/models/news.dart'; 

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.news});

  final News news;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? 'News Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null)
              Image.network(news.urlToImage!, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              news.title ?? 'No Title Available',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              news.description ?? 'No Description Available',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (news.url != null && news.url!.isNotEmpty) {
                  _launchURL(news.url!);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Article URL is not available'),
                    ),
                  );
                }
              },
              child: const Text('View Full Article'),
            ),
          ],
        ),
      ),
    );
  }
}
