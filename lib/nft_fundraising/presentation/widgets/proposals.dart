import 'package:flutter/material.dart';
import 'dart:convert';

import 'list_tile.dart';

class JsonListView extends StatelessWidget {
  final Future<String> jsonDataFuture;

  const JsonListView({super.key, required this.jsonDataFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: jsonDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data available'));
        } else {
          debugPrint("${snapshot.data.runtimeType}");
          final listTiles = parseJsonToListTiles(snapshot.data!, context);
          return Column(
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: listTiles,
              ),
            ],
          );
        }
      },
    );
  }
}
