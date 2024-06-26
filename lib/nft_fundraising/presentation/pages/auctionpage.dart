import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../costant/constants.dart';
import '../widgets/auction_boudy.dart';
import '../widgets/proposals.dart';

class AuctionPage extends StatefulWidget {
  const AuctionPage({super.key});

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  // Future<String> loadJsonData() async {
  //   // Simulating network delay or loading time
  //   // await Future.delayed(Duration(seconds: 1));
  //
  //   // Convert dataFromBlockChain to a JSON string
  //   String jsonDataString = jsonEncode(dataFromBlockChain);
  //
  //   // Return the JSON string
  //   return jsonDataString;
  // }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: width > 750 ? width * 0.7 : width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              // Center content horizontally
              children: [
                AuctionBody(),
                JsonListView(
                  jsonDataFuture: loadJsonData(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> loadJsonData() async {
    String jsonDataString = jsonEncode(dataFromBlockChain);
    return jsonDataString;
  }
}
