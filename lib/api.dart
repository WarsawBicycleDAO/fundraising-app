class Api {
  List<Proposal> proposals = [
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

  NftBidding currentNftBidding = NftBidding(
      "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/in/wp-content/uploads/2022/03/monkey-g412399084_1280.jpg",
      13);

  List<Proposal> getProposals() {
    return proposals;
  }

  void addProposal(Proposal proposal) {
    proposals.add(proposal);
  }

  NftBidding getCurrentNftBidding() {
    return currentNftBidding;
  }

  void makeBid(int bid) {
    currentNftBidding.bid = bid;
  }

  void voteUp(String proposalId) {
    var proposal =
        proposals.where((proposal) => proposal.id == proposalId).firstOrNull;
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
  int bid;

  NftBidding(this.url, this.bid);
}
