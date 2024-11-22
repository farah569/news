import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/tabs/sources_tabs.dart';
import 'package:news/widgets/error_indicator.dart';
import 'package:news/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(this.categoryId, {super.key});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(sources);
        }
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:news/tabs/sources_tabs.dart';

// class CategoryDetails extends StatefulWidget {
//   const CategoryDetails(this.categoryId);

//   final String categoryId;

//   @override
//   State<CategoryDetails> createState() => _CategoryDetailsState();
// }

// class _CategoryDetailsState extends State<CategoryDetails> {
//   List<Source> sources=List.generate(
//     10,
//     (index)=>Source(
//       id: '$index',
//       name:'Source $index',
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return SourcesTabs(sources);
//   }
// }

// List<Source> sources=List.generate(
//   10,
//   (index)=>Source(
//     id: '$index',
//     name:'Source $index',
//   ),
// );
