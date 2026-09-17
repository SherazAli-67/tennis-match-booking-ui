import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_data.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';
import 'package:tennis_match_booking/core/models/availability_match.dart';
import 'package:tennis_match_booking/core/models/calendar_day.dart';
import 'package:tennis_match_booking/core/models/match_player.dart';
import 'package:tennis_match_booking/presentation/widgets/app_button.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  int _selectedDayIndex = 4;

  CalendarDay get _selectedDay => AppData.calendarDays[_selectedDayIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.screenGradientBgColor.withValues(alpha: 0.37),
              AppColors.screenGradientBgColor.withValues(alpha: 0.26),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: .fromLTRB(12, 8, 12, 0),
                child: _buildHeader(),
              ),
              Expanded(
                child: ListView(
                  padding: .fromLTRB(20, 16, 20, 100),
                  children: [
                    _buildWeekCard(),
                    const SizedBox(height: 14),
                    _buildTimeSlotCard(),
                    const SizedBox(height: 14),
                    for (var i = 0; i < AppData.availabilityMatches.length; i++) ...[
                      _buildMatchCard(match: AppData.availabilityMatches[i]),
                      if (i != AppData.availabilityMatches.length - 1) const SizedBox(height: 14),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimaryColor),
        ),
        Expanded(child: Text(StringConst.availability, style: AppTextStyles.title, textAlign: .center)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: AppColors.textPrimaryColor),
        ),
      ],
    );
  }

  Widget _buildWeekCard() {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AppIcons.icCalendar, width: 20, height: 20, colorFilter: .mode(AppColors.primaryGreenColor, .srcIn)),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(StringConst.availability, style: AppTextStyles.bodyMedium),
                    Text(StringConst.thisWeek, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Icon(Icons.expand_more, color: AppColors.textMutedColor),
            ],
          ),
          Row(
            children: [
              for (var i = 0; i < AppData.calendarDays.length; i++)
                Expanded(child: _buildDayItem(index: i, day: AppData.calendarDays[i])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayItem({required int index, required CalendarDay day}) {
    final isSelected = _selectedDayIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedDayIndex = index),
      child: Column(
        spacing: 8,
        children: [
          Text(
            day.weekday,
            style: AppTextStyles.caption.copyWith(
              fontSize: 11,
              color: isSelected ? AppColors.primaryGreenColor : AppColors.textMutedColor,
            ),
          ),
          Container(
            width: 36,
            height: 36,
            alignment: .center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryGreenColor : Colors.transparent,
              shape: .circle,
            ),
            child: Text(
              '${day.day}',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSelected ? AppColors.whiteColor : AppColors.textPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotCard() {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(AppIcons.icCalendar, width: 20, height: 20, colorFilter: .mode(AppColors.primaryGreenColor, .srcIn)),
              Text(_selectedDay.label, style: AppTextStyles.bodyMedium),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Text(StringConst.startTime, style: AppTextStyles.caption),
              Expanded(
                child: Stack(
                  alignment: .centerLeft,
                  children: [
                    Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.chipInactiveColor,
                        borderRadius: .circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.72,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreenColor,
                          borderRadius: .circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(StringConst.endTime, style: AppTextStyles.caption),
            ],
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: AppButton(label: StringConst.cancel, variant: .secondary, onPressed: () => context.pop()),
              ),
              Expanded(
                child: AppButton(label: StringConst.confirm, onPressed: () => context.pop()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMatchCard({required AvailabilityMatch match}) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 14,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(match.title, style: AppTextStyles.title),
                    Text(match.subtitle, style: AppTextStyles.caption),
                  ],
                ),
              ),
              Container(
                padding: .symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primaryGreenColor,
                  borderRadius: .circular(16),
                ),
                child: Text(match.status, style: AppTextStyles.button.copyWith(fontSize: 11)),
              ),
            ],
          ),
          for (final player in match.players) _buildPlayerRow(player: player),
        ],
      ),
    );
  }

  Widget _buildPlayerRow({required MatchPlayer player}) {
    return Row(
      spacing: 10,
      children: [
        Text(player.flagEmoji, style: const TextStyle(fontSize: 22)),
        Expanded(child: Text(player.name, style: AppTextStyles.bodyMedium)),
        Row(
          spacing: 14,
          children: [
            for (final score in player.setScores)
              SizedBox(
                width: 18,
                child: Text('$score', style: AppTextStyles.title, textAlign: .center),
              ),
          ],
        ),
      ],
    );
  }
}
