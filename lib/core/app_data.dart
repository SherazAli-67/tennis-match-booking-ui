import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/models/availability_match.dart';
import 'package:tennis_match_booking/core/models/calendar_day.dart';
import 'package:tennis_match_booking/core/models/match_player.dart';
import 'package:tennis_match_booking/core/models/upcoming_match.dart';
import 'package:tennis_match_booking/core/models/user_profile.dart';

import 'app_icons.dart';

class AppData {
  static const currentUser = UserProfile(
    name: 'Sheraz Ali',
    avatarUrl: AppIcons.devImg,
  );

  static const categories = [
    'All',
    'Court',
    'Match',
    'Partner',
    'Pickleball',
    'Tennis'
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

  static List<String> imageUrls = [
    'https://images.unsplash.com/photo-1614204424926-196a80bf0be8?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGVvcGxlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlfGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1602442787305-decbd65be507?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d29tZW58ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1690444963408-9573a17a8058?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHdvbWVufGVufDB8fDB8fHww',
    'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHdvbWVufGVufDB8fDB8fHww'
  ];
}
