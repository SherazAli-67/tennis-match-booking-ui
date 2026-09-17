class MatchPlayer {
  const MatchPlayer({
    required this.name,
    required this.countryCode,
    required this.avatarUrl,
    required this.setScores,
  });

  final String name;
  final String countryCode;
  final String avatarUrl;
  final List<int> setScores;

  String get flagEmoji {
    return countryCode.toUpperCase().codeUnits.map((unit) => String.fromCharCode(unit + 127397)).join();
  }
}
