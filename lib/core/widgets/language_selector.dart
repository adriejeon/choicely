import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/locale_provider.dart';
import '../../l10n/app_localizations.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () => _showLanguageModal(context, ref),
      icon: Icon(
        Icons.language,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      tooltip: l10n.language,
    );
  }

  void _showLanguageModal(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final localeState = ref.read(localeProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              l10n.language,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Language options
            _buildLanguageOption(
              context,
              ref,
              const Locale('ko', 'KR'),
              l10n.korean,
              '🇰🇷',
              localeState.currentLocale.languageCode == 'ko',
            ),
            const SizedBox(height: 12),
            _buildLanguageOption(
              context,
              ref,
              const Locale('en', 'US'),
              l10n.english,
              '🇺🇸',
              localeState.currentLocale.languageCode == 'en',
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    WidgetRef ref,
    Locale locale,
    String languageName,
    String flag,
    bool isSelected,
  ) {
    return InkWell(
      onTap: () {
        ref.read(localeProvider.notifier).changeLocale(locale);
        Navigator.of(context).pop();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                languageName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
