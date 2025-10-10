import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_spacing.dart';

/// 섹션 헤더 위젯 - 타이틀과 서브텍스트가 있는 공통 스타일
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final bool centerAlign;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.padding,
    this.centerAlign = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          const EdgeInsets.symmetric(
            vertical: AppSpacing.paddingMedium, // 16px
          ),
      child: Column(
        crossAxisAlignment: centerAlign
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle ?? AppTextStyles.headline4),
          if (subtitle != null) ...[
            const SizedBox(height: 4), // 4px 간격
            Text(
              subtitle!,
              style:
                  subtitleStyle ??
                  AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}
