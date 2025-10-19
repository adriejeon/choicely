import 'package:flutter/material.dart';
import '../ads/admob_handler.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  final AdmobHandler _admobHandler = AdmobHandler();

  @override
  void initState() {
    super.initState();
    // 배너 상태 변경 콜백 설정
    _admobHandler.setBannerCallback(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.grey[100],
      child: _admobHandler.getBannerAd(),
    );
  }
}
