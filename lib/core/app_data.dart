import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/models/availability_match.dart';
import 'package:tennis_match_booking/core/models/calendar_day.dart';
import 'package:tennis_match_booking/core/models/match_player.dart';
import 'package:tennis_match_booking/core/models/upcoming_match.dart';
import 'package:tennis_match_booking/core/models/user_profile.dart';

class AppData {
  static const currentUser = UserProfile(
    name: 'Matthew',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
  );

  static const categories = [
    'All',
    'Single',
    'Double',
    'Indoor',
    'Outdoor',
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
      imageUrl: 'https://images.unsplash.com/photo-1554068865-24cecd4e34b8?w=200&h=200&fit=crop',
      playerAvatars: [
        'https://i.pravatar.cc/150?img=1',
        'https://i.pravatar.cc/150?img=5',
        'https://i.pravatar.cc/150?img=9',
      ],
      status: StringConst.active,
      actionLabel: StringConst.bookAMatch,
    ),
    UpcomingMatch(
      title: "Men's Single",
      price: '\$120',
      imageUrl: 'https://images.unsplash.com/photo-1595435934249-5df7ed86e1c0?w=200&h=200&fit=crop',
      playerAvatars: [
        'https://i.pravatar.cc/150?img=11',
        'https://i.pravatar.cc/150?img=13',
      ],
      status: StringConst.active,
      actionLabel: StringConst.joinMatch,
    ),
    UpcomingMatch(
      title: 'Mixed Doubles',
      price: '\$200',
      imageUrl: 'https://images.unsplash.com/photo-1622279457486-62dcc4a431d6?w=200&h=200&fit=crop',
      playerAvatars: [
        'https://i.pravatar.cc/150?img=20',
        'https://i.pravatar.cc/150?img=25',
        'https://i.pravatar.cc/150?img=32',
        'https://i.pravatar.cc/150?img=33',
      ],
      status: StringConst.active,
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
