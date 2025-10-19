import 'package:flutter/material.dart';
import '../ads/admob_handler.dart';
import '../widgets/ad_banner_widget.dart';

class AdExampleScreen extends StatefulWidget {
  const AdExampleScreen({super.key});

  @override
  State<AdExampleScreen> createState() => _AdExampleScreenState();
}

class _AdExampleScreenState extends State<AdExampleScreen> {
  final AdmobHandler _admobHandler = AdmobHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob 예시'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // 상단 배너 광고
          const AdBannerWidget(),

          // 메인 콘텐츠
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.ads_click, size: 64, color: Colors.blue),
                  const SizedBox(height: 16),
                  const Text(
                    'AdMob 광고 예시',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '이 화면은 AdMob 광고 기능을 보여주는 예시입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),

                  // 전면 광고 로드 버튼
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await _admobHandler.loadInterstitialAd();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('전면 광고가 로드되었습니다!')),
                          );
                        }
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('광고 로드 실패: $e')),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('전면 광고 로드'),
                  ),

                  const SizedBox(height: 16),

                  // 전면 광고 표시 버튼
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_admobHandler.isInterstitialAdLoaded) {
                        await _admobHandler.showInterstitialAd();
                      } else {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('먼저 전면 광고를 로드해주세요!')),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('전면 광고 표시'),
                  ),

                  const SizedBox(height: 16),

                  // 광고 상태 표시
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '광고 상태',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text('광고 활성화: ${AdmobHandler.isAdEnabled}'),
                        Text(
                          '전면 광고 로드됨: ${_admobHandler.isInterstitialAdLoaded}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 하단 배너 광고
          const AdBannerWidget(),
        ],
      ),
    );
  }
}
