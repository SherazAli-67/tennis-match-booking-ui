import 'package:flutter/material.dart';
import 'package:tennis_match_booking/core/app_textstyles.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title, style: AppTextStyles.sectionTitle)));
  }
}
