import 'package:tennis_match_booking/core/models/match_player.dart';

class AvailabilityMatch {
  const AvailabilityMatch({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.players,
  });

  final String title;
  final String subtitle;
  final String status;
  final List<MatchPlayer> players;
}
