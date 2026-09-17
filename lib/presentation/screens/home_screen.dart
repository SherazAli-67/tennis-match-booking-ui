import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_match_booking/constants/string_const.dart';
import 'package:tennis_match_booking/core/app_colors.dart';
import 'package:tennis_match_booking/core/app_data.dart';
import 'package:tennis_match_booking/core/app_icons.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';
import 'package:tennis_match_booking/core/models/upcoming_match.dart';
import 'package:tennis_match_booking/presentation/widgets/app_chip.dart';
import 'package:tennis_match_booking/presentation/widgets/avatar_stack.dart';
import 'package:tennis_match_booking/router/router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.screenGradientBgColor.withValues(alpha: 0.37),
            AppColors.screenGradientBgColor.withValues(alpha: 0.26),
          ],
            stops: [
              0.0, 1.0
            ]
          )
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: .start,
            spacing: 18,
            children: [
              Padding(
                padding: .fromLTRB(20, 8, 20, 0),
                child: _buildHeader(),
              ),
              Padding(
                padding: .symmetric(horizontal: 20),
                child: _buildSearchField(),
              ),
              _buildCategoryChips(),
              Padding(
                padding: .symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: Text(StringConst.upcomingGames, style: AppTextStyles.sectionTitle)),
                    Text(StringConst.seeAll, style: AppTextStyles.caption.copyWith(color: AppColors.textMutedColor)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: .fromLTRB(20, 0, 20, 100),
                  itemCount: AppData.upcomingMatches.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 14),
                  itemBuilder: (context, index) => _buildMatchCard(match: AppData.upcomingMatches[index]),
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
      spacing: 12,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(shape: .circle, color: AppColors.whiteColor),
          clipBehavior: .antiAlias,
          child: Image.network(
            AppData.currentUser.avatarUrl,
            fit: .cover,
            errorBuilder: (context, error, stackTrace) => ColoredBox(color: AppColors.chipInactiveColor),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 2,
            children: [
              Text(StringConst.goodMorning, style: AppTextStyles.greetingLabel),
              Text('${AppData.currentUser.name} 👋', style: AppTextStyles.greeting),
            ],
          ),
        ),
        _buildIconButton(iconPath: AppIcons.icNotification),
      ],
    );
  }

  Widget _buildIconButton({required String iconPath}) {
    return Container(
      width: 44,
      height: 44,
      alignment: .center,
      decoration: BoxDecoration(color: AppColors.whiteColor, shape: .circle),
      child: SvgPicture.asset(iconPath, width: 22, height: 22, colorFilter: .mode(AppColors.primaryGreenColor, .srcIn)),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: .symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(StringConst.searchHint, style: AppTextStyles.body.copyWith(color: AppColors.textHintColor)),
          ),
          SvgPicture.asset(AppIcons.icSearch, width: 20, height: 20, colorFilter: .mode(AppColors.textHintColor, .srcIn)),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: .horizontal,
        padding: .symmetric(horizontal: 20),
        itemCount: AppData.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => AppChip(
          label: AppData.categories[index],
          isSelected: _selectedCategoryIndex == index,
          onTap: () => setState(() => _selectedCategoryIndex = index),
        ),
      ),
    );
  }

  Widget _buildMatchCard({required UpcomingMatch match}) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(24),
      ),
      child: Row(
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: .circular(18),
            child: Image.asset(
              match.imageUrl,
              width: 155,
              height: 155,
              fit: .cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(
                color: AppColors.chipInactiveColor,
                child: SizedBox(width: 92, height: 118),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text(match.title, style: AppTextStyles.title),
                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(AppIcons.icLocation, width: 12, height: 12, colorFilter: .mode(AppColors.textMutedColor, .srcIn)),
                    Expanded(child: Text(match.location, style: AppTextStyles.caption, overflow: .ellipsis)),
                  ],
                ),
                Text(match.feeLabel, style: AppTextStyles.caption),
                Row(
                  children: [
                    AvatarStack(imageUrls: match.playerAvatars, size: 24),
                    const SizedBox(width: 4),
                    Text('+${match.extraPlayerCount}', style: AppTextStyles.caption),
                    const Spacer(),
                    Text(match.price, style: AppTextStyles.price),
                  ],
                ),
                Align(
                  alignment: .centerRight,
                  child: _buildBookButton(label: match.actionLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookButton({required String label}) {
    return GestureDetector(
      onTap: () => context.push(NamedRoutes.availability.routeName),
      child: Container(
        padding: .symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryGreenColor,
          borderRadius: .circular(20),
        ),
        child: Text(label, style: AppTextStyles.button.copyWith(fontSize: 12)),
      ),
    );
  }
}
