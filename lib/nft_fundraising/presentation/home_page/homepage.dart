import 'package:flutter/material.dart';
import 'package:nft_fundrasing/nft_fundraising/presentation/pages/auctionpage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AuctionPage();
  }
}
