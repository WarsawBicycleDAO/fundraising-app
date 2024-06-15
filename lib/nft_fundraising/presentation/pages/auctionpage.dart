import 'package:flutter/material.dart';
class AuctionPage extends StatefulWidget {
  const AuctionPage({super.key});

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",),
        centerTitle: true,
      ),
      body: Center(
        child: Text("home Page"),
      ),
    );
  }
}
