class UpcomingMatch {
  const UpcomingMatch({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.playerAvatars,
    required this.location,
    required this.feeLabel,
    required this.extraPlayerCount,
    required this.actionLabel,
  });

  final String title;
  final String price;
  final String imageUrl;
  final List<String> playerAvatars;
  final String location;
  final String feeLabel;
  final int extraPlayerCount;
  final String actionLabel;
}
