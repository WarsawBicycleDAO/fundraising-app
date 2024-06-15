import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nft_fundrasing/api.dart';
import 'package:nft_fundrasing/main.dart';

List<ListTile> parseJsonToListTiles(String jsonData, BuildContext context) {
  final data = json.decode(jsonData)['data'] as List;
  debugPrint("==================${data[0]}");

  return MyApp.api.getProposals().map((item) {
    return  ListTile(
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
              MyApp.api.voteUp(item.id);
            },
            icon: Icon(Icons.thumb_up), // Customize icon color
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
    );




  }).toList();
}
