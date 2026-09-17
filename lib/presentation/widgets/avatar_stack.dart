import 'package:flutter/material.dart';
import 'package:tennis_match_booking/core/app_colors.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.imageUrls,
    this.size = 28,
    this.maxVisible = 4,
  });

  final List<String> imageUrls;
  final double size;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final visibleUrls = imageUrls.take(maxVisible).toList();
    final overlap = size * 0.35;
    final width = visibleUrls.isEmpty ? 0.0 : size + (visibleUrls.length - 1) * (size - overlap);

    return SizedBox(
      width: width,
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < visibleUrls.length; i++)
            Positioned(
              left: i * (size - overlap),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(color: AppColors.whiteColor, width: 1.5),
                  color: AppColors.surfaceColor,
                ),
                clipBehavior: .antiAlias,
                child: Image.network(
                  visibleUrls[i],
                  fit: .cover,
                  errorBuilder: (context, error, stackTrace) => ColoredBox(color: AppColors.chipInactiveColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
