import 'package:tennis_match_booking/core/models/match_player.dart';

class AvailabilityMatch {
  const AvailabilityMatch({
    required this.title,
    required this.status,
    required this.players,
    required this.scores,
  });

  final String title;
  final String status;
  final List<MatchPlayer> players;
  final List<String> scores;
}
