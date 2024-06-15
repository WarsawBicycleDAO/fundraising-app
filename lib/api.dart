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
  ];

  NftBidding _currentNftBidding = NftBidding(
      "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/in/wp-content/uploads/2022/03/monkey-g412399084_1280.jpg",
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
