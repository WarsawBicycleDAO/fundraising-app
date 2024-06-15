import 'dart:convert';
import 'package:flutter/material.dart';

List<ListTile> parseJsonToListTiles(String jsonData, BuildContext context) {
  final data = json.decode(jsonData)['data'] as List;
  debugPrint("==================${data[0]}");

  return data.map((item) {
    return ListTile(
      title: Text(
        item['title'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        item['subTiltle'],
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 14,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item['voteCounts'].toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.thumb_up,
            color: Colors.blue, // Customize icon color
          ),
        ],
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(item['title']),
          content: Text(item['contents']),
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
