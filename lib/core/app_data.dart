import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/models/availability_match.dart';
import 'package:tennis_match_booking/core/models/calendar_day.dart';
import 'package:tennis_match_booking/core/models/match_player.dart';
import 'package:tennis_match_booking/core/models/upcoming_match.dart';
import 'package:tennis_match_booking/core/models/user_profile.dart';

import 'app_icons.dart';

class AppData {
  static const currentUser = UserProfile(
    name: 'Toma Shaha',
    avatarUrl: 'https://i.pravatar.cc/150?img=47',
  );

  static const categories = [
    'All',
    'Court',
    'Match',
    'Partner',
  ];

  static const timeSlots = [
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
  ];

  static const calendarDays = [
    CalendarDay(weekday: 'Sun', day: 5, label: 'Sunday (5 Jan)'),
    CalendarDay(weekday: 'Mon', day: 6, label: 'Monday (6 Jan)'),
    CalendarDay(weekday: 'Tue', day: 7, label: 'Tuesday (7 Jan)'),
    CalendarDay(weekday: 'Wed', day: 8, label: 'Wednesday (8 Jan)'),
    CalendarDay(weekday: 'Thu', day: 9, label: 'Thursday (9 Jan)'),
    CalendarDay(weekday: 'Fri', day: 10, label: 'Friday (10 Jan)'),
    CalendarDay(weekday: 'Sat', day: 11, label: 'Saturday (11 Jan)'),
  ];

  static const upcomingMatches = [
    UpcomingMatch(
      title: 'Female League',
      price: '\$150',
      imageUrl: AppIcons.femaleLeagueImg,
      playerAvatars: [
        'https://i.pravatar.cc/150?img=1',
        'https://i.pravatar.cc/150?img=5',
        'https://i.pravatar.cc/150?img=9',
      ],
      location: StringConst.stGeorgeNy,
      feeLabel: StringConst.matchFeePerTeam,
      extraPlayerCount: 5,
      actionLabel: StringConst.bookAMatch,
    ),
    UpcomingMatch(
      title: "Men's Single",
      price: '\$75',
      imageUrl: AppIcons.maleLeagueImg,
      playerAvatars: [
        'https://i.pravatar.cc/150?img=11',
        'https://i.pravatar.cc/150?img=13',
      ],
      location: StringConst.stGeorgeNy,
      feeLabel: StringConst.matchFeePerTeam,
      extraPlayerCount: 5,
      actionLabel: StringConst.bookAMatch,
    ),
  ];

  static const availabilityMatches = [
    AvailabilityMatch(
      title: "Woman's Singles",
      subtitle: StringConst.finalMatch,
      status: StringConst.completed,
      players: [
        MatchPlayer(
          name: 'Coco Gauff',
          countryCode: 'US',
          avatarUrl: 'https://i.pravatar.cc/150?img=47',
          setScores: [6, 4, 8],
        ),
        MatchPlayer(
          name: 'Elena Rybakina',
          countryCode: 'KZ',
          avatarUrl: 'https://i.pravatar.cc/150?img=45',
          setScores: [4, 8, 3],
        ),
      ],
    ),
    AvailabilityMatch(
      title: "Man's Singles",
      subtitle: StringConst.finalMatch,
      status: StringConst.completed,
      players: [
        MatchPlayer(
          name: 'Jannik Sinner',
          countryCode: 'IT',
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
          setScores: [6, 4, 8],
        ),
        MatchPlayer(
          name: 'Carlos Alcaraz',
          countryCode: 'ES',
          avatarUrl: 'https://i.pravatar.cc/150?img=14',
          setScores: [4, 8, 3],
        ),
      ],
    ),
  ];
}
