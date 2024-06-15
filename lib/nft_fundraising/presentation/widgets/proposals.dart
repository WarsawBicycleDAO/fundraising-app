import 'package:flutter/material.dart';
import 'dart:convert';

import '../../../main.dart';
import 'list_tile.dart';

class JsonListView extends StatefulWidget {
  final Future<String> jsonDataFuture;

  const JsonListView({super.key, required this.jsonDataFuture});

  @override
  State<JsonListView> createState() => _JsonListViewState();
}

class _JsonListViewState extends State<JsonListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: widget.jsonDataFuture,
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

  List<Card> parseJsonToListTiles(String jsonData, BuildContext context) {
    final data = json.decode(jsonData)['data'] as List;
    debugPrint("==================${data[0]}");

    return MyApp.api.getProposals().map((item) {
      return  Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        elevation: 4,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            item.subtitle,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.votes.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              IconButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    MyApp.api.voteUp(item.id);
                  });
                },
                icon: Icon(Icons.thumb_up),
              ),
            ],
          ),
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(item.title),
              content: Text(item.description),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        ),
      );





    }).toList();
  }
}
