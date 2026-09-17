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
          child: Padding(
            padding: const .symmetric(horizontal: 21.0, vertical: 4),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 32,
              children: [
                _buildHeader(),
                Column(
                  crossAxisAlignment: .start,
                  spacing: 16,
                  children: [
                    _buildSearchField(),
                    _buildCategoryChips(),
                  ],
                ),
                Expanded(
                  child: Column(
                    spacing: 24,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(StringConst.upcomingGames, style: AppTextStyles.sectionTitle)),
                          Container(
                            decoration: BoxDecoration(
                                border: .all(color: AppColors.whiteColor),
                                color: AppColors.surfaceColor,
                                borderRadius: .circular(8.75)
                            ),
                            padding: .all(8.75),
                            child: Text(StringConst.seeAll, style: AppTextStyles.caption.copyWith(color: AppColors.textMutedColor)),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: AppData.upcomingMatches.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 24),
                          itemBuilder: (context, index) => _buildMatchCard(match: AppData.upcomingMatches[index]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
          decoration: BoxDecoration(shape: .circle, color: AppColors.whiteColor, border: .all(color: AppColors.statusActiveColor)),
          clipBehavior: .antiAlias,
          child: ClipOval(
            child: Image.asset(AppData.currentUser.avatarUrl, fit: .cover,),
          )
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 2,
            children: [
              Text(StringConst.goodMorning, style: AppTextStyles.greetingLabel),
              Text('${AppData.currentUser.name} 🎾', style: AppTextStyles.greeting),
            ],
          ),
        ),
        _buildIconButton(iconPath: AppIcons.icNotification),
      ],
    );
  }

  Widget _buildIconButton({required String iconPath}) {
    return Container(
      alignment: .center,
      padding: .all(10.93),
      decoration: BoxDecoration(color: AppColors.lightWhiteColor, borderRadius: .circular(18)),
      child: SvgPicture.asset(iconPath, width: 26, height: 26, colorFilter: .mode(AppColors.primaryGreenColor, .srcIn)),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: .symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(17.49),
        border: .all(color: AppColors.primaryGreenColor.withValues(alpha: 0.22))
      ),
      alignment: .center,
      child: Row(
        children: [
          Expanded(
            child: Text(StringConst.searchHint, style: AppTextStyles.body.copyWith(color: AppColors.textHintColor)),
          ),
          SvgPicture.asset(AppIcons.icSearch, width: 18, height: 18, colorFilter: .mode(AppColors.textHintColor, .srcIn)),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: .horizontal,
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
      padding: .symmetric(horizontal: 17.49, vertical: 18.79),
      decoration: BoxDecoration(
        color: AppColors.matchCardSurfaceColor,
        borderRadius: .circular(32),
        border: .all(color: AppColors.whiteColor, width: 2)
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              ClipRRect(
                borderRadius: .circular(26.24),
                child: Image.asset(match.imageUrl, width: 155, height: 155, fit: .cover,),),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 27,
                  children: [
                    Column(
                      children: [
                        Text(match.title, style: AppTextStyles.title.copyWith(fontSize: 22, fontWeight: .w500)),
                        Row(
                          spacing: 4,
                          children: [
                            SvgPicture.asset(AppIcons.icLocation,),
                            Expanded(child: Text(match.location, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textMutedColor), overflow: .ellipsis)),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(match.feeLabel, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.greyColor)),
                        Text(match.price, style: AppTextStyles.price),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                      alignment: .topLeft,
                      children: List.generate(4, (index){
                        String imageUrl = AppData.imageUrls[index];
                        return  index == 0 ? _buildUserImageItemWidget(imageUrl) :  Positioned(
                            left: index * 30,
                            child: index == 3 ? _buildMoreWidget() : _buildUserImageItemWidget(imageUrl) );
                      })
                  ),
                ),
                Align(
                  alignment: .centerRight,
                  child: _buildBookButton(label: match.actionLabel),
                ),
              ],
            ),
          )


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
          color: AppColors.btnBgColor.withValues(alpha: 0.8),
          borderRadius: .circular(17.49),
        ),
        child: Text(label, style: AppTextStyles.title.copyWith(color: Colors.white)),
      ),
    );
  }

  Widget _buildUserImageItemWidget(String imageUrl) => Container(
      height: 41.55, width: 41.55,
      decoration: BoxDecoration(
          borderRadius: .circular(12.57),
          border: .all(color: AppColors.whiteColor),
      ),
      child: ClipRRect(borderRadius: .circular(10),child: Image.network(imageUrl, fit: .cover,),));

  Widget _buildMoreWidget() {
    return Container(
      decoration: BoxDecoration(
        shape: .circle,
        color: AppColors.fillGreyColor,
        border: .all(color: Colors.white, width: 2)
      ),
      padding: .symmetric(horizontal: 12.27, vertical: 12.77),
      child: Text("+5",style: AppTextStyles.loginHint.copyWith(color: Colors.white),),
    );
  }
}
