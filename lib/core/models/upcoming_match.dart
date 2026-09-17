class UpcomingMatch {
  const UpcomingMatch({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.playerAvatars,
    required this.status,
    required this.actionLabel,
  });

  final String title;
  final String price;
  final String imageUrl;
  final List<String> playerAvatars;
  final String status;
  final String actionLabel;
}
