//import 'package:collection/collection.dart';

import 'source.dart';


class SourcesResponse {
  final String? status;
  final List<Source>? sources;

  const SourcesResponse({this.status, this.sources});

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

 
}
//@immutable
 // Map<String, dynamic> toJson() => {
  //       'status': status,
  //       'sources': sources?.map((e) => e.toJson()).toList(),
  //     };
