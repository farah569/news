
import 'package:flutter/material.dart';

class NewsSearchDelegate extends SearchDelegate<String> {
  final List<Map<String, String>> allNews = [

  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';  
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Map<String, String>> results = allNews
        .where((news) =>
            news["title"]!.toLowerCase().contains(query.toLowerCase()) ||  
            news["source"]!.toLowerCase().contains(query.toLowerCase()))  
        .toList();

    if (results.isEmpty) {
      return Center(
        child: Text(
          'No results found for "$query".',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]["title"]!),
          subtitle: Text(results[index]["source"]!),
          onTap: () {
            close(context, results[index]["title"]!);  
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, String>> suggestions = allNews
        .where((news) =>
            news["title"]!.toLowerCase().contains(query.toLowerCase()) ||
            news["source"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (suggestions.isEmpty) {
      return Center(
        child: Text(
          'No suggestions found for "$query".',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]["title"]!),
          subtitle: Text(suggestions[index]["source"]!),
          onTap: () {
            query = suggestions[index]["title"]!;  
            showResults(context);
          },
        );
      },
    );
  }
}
