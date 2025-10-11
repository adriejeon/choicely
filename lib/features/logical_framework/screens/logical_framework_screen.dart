import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../providers/logical_framework_provider.dart';

class LogicalFrameworkScreen extends ConsumerStatefulWidget {
  final String concernId;

  const LogicalFrameworkScreen({super.key, required this.concernId});

  @override
  ConsumerState<LogicalFrameworkScreen> createState() =>
      _LogicalFrameworkScreenState();
}

class _LogicalFrameworkScreenState
    extends ConsumerState<LogicalFrameworkScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeFramework();
  }

  Future<void> _initializeFramework() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await ref
          .read(logicalFrameworkProvider(widget.concernId).notifier)
          .createOrUpdateFramework();

      if (mounted) {
        context.push('/concern/${widget.concernId}/comparison-setup');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류가 발생했습니다: $e'),
            backgroundColor: AppColors.grey80,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // 고민 상세 페이지로 바로 이동
          context.go('/concern/${widget.concernId}');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('논리 분석')),
        body: Center(
          child: _isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    const SizedBox(height: AppSpacing.paddingLarge),
                    Text(
                      '논리 분석을 준비하고 있습니다...',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
