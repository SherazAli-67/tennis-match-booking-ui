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
    CalendarDay(weekday: 'M', day: 10),
    CalendarDay(weekday: 'T', day: 11),
    CalendarDay(weekday: 'W', day: 12),
    CalendarDay(weekday: 'T', day: 13),
    CalendarDay(weekday: 'F', day: 14),
    CalendarDay(weekday: 'S', day: 15),
    CalendarDay(weekday: 'S', day: 16),
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
      title: "Women's Singles",
      status: StringConst.available,
      players: [
        MatchPlayer(
          name: 'Emma Wilson',
          countryCode: 'US',
          avatarUrl: 'https://i.pravatar.cc/150?img=47',
        ),
        MatchPlayer(
          name: 'Sofia Rossi',
          countryCode: 'IT',
          avatarUrl: 'https://i.pravatar.cc/150?img=45',
        ),
      ],
      scores: ['6', '4', '4', '3'],
    ),
    AvailabilityMatch(
      title: "Men's Doubles",
      status: StringConst.booked,
      players: [
        MatchPlayer(
          name: 'James Carter',
          countryCode: 'GB',
          avatarUrl: 'https://i.pravatar.cc/150?img=14',
        ),
        MatchPlayer(
          name: 'Lucas Martin',
          countryCode: 'FR',
          avatarUrl: 'https://i.pravatar.cc/150?img=15',
        ),
        MatchPlayer(
          name: 'Noah Kim',
          countryCode: 'KR',
          avatarUrl: 'https://i.pravatar.cc/150?img=16',
        ),
        MatchPlayer(
          name: 'Oliver Braun',
          countryCode: 'DE',
          avatarUrl: 'https://i.pravatar.cc/150?img=17',
        ),
      ],
      scores: ['6', '3', '7', '5'],
    ),
    AvailabilityMatch(
      title: 'Open Court',
      status: StringConst.full,
      players: [
        MatchPlayer(
          name: 'Ava Chen',
          countryCode: 'CN',
          avatarUrl: 'https://i.pravatar.cc/150?img=28',
        ),
        MatchPlayer(
          name: 'Mia Lopez',
          countryCode: 'ES',
          avatarUrl: 'https://i.pravatar.cc/150?img=29',
        ),
      ],
      scores: ['6', '6', '2', '1'],
    ),
  ];
}
