class Api {
  List<Proposal> _proposals = [
    Proposal(
        "proposal-1",
        "Biking night",
        "Let's bike together at 22.06!",
        1000,
        "We believe everyone should bike. Biking is healthy and funny. Please bike with us."),
    Proposal(
        "proposal-2",
        "Skating night",
        "Let's skate together at 23.06!",
        999,
        "We believe everyone should skate. Skating is healthy and funny. Please skate with us."),
    Proposal(
        "proposal-1",
        "Biking night",
        "Let's bike together at 22.06!",
        1000,
        "We believe everyone should bike. Biking is healthy and funny. Please bike with us."),
    Proposal(
        "proposal-2",
        "Skating night",
        "Let's skate together at 23.06!",
        999,
        "We believe everyone should skate. Skating is healthy and funny. Please skate with us."),
    Proposal(
        "proposal-1",
        "Biking night",
        "Let's bike together at 22.06!",
        1000,
        "We believe everyone should bike. Biking is healthy and funny. Please bike with us."),
    Proposal(
        "proposal-2",
        "Skating night",
        "Let's skate together at 23.06!",
        999,
        "We believe everyone should skate. Skating is healthy and funny. Please skate with us."),
  ];

  NftBidding _currentNftBidding = NftBidding(
      "https://th.bing.com/th/id/R.5d58e453b70a83e2c1437cc79c071152?rik=DnFRw4oUBjLZ8g&riu=http%3a%2f%2fwww.playtoearn.online%2fwp-content%2fuploads%2f2021%2f10%2fBored-Ape-Yacht-Club-NFT-avatar.png&ehk=J4Pe0jNr7sURLybbVvFnHISjRPvAw60Q3fYzG7xBxag%3d&risl=&pid=ImgRaw&r=0",
      "the crazy monkey",
      DateTime(2024, 6, 27),
      13);

  List<Proposal> getProposals() {
    return _proposals;
  }

  void addProposal(Proposal proposal) {
    _proposals.add(proposal);
  }

  NftBidding getCurrentNftBidding() {
    return _currentNftBidding;
  }

  void makeBid(int bid) {
    _currentNftBidding.bid = bid;
  }

  void voteUp(String proposalId) {
    var proposal =
        _proposals.where((proposal) => proposal.id == proposalId).firstOrNull;
    proposal?.votes++;
  }
}

class Proposal {
  String id;
  String title;
  String subtitle;
  int votes;
  String description;

  Proposal(this.id, this.title, this.subtitle, this.votes, this.description);
}

class NftBidding {
  String url;
  String name;
  DateTime endTime;
  int bid;

  NftBidding(this.url, this.name, this.endTime, this.bid);
}
