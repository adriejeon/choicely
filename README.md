# Choicely 🎯

고민 해결을 위한 직관과 논리 분석 앱

## 소개

Choicely는 사용자가 삶의 중요한 결정을 내릴 때 도움을 주는 앱입니다. 논리적 분석과 직관적 통찰을 모두 활용하여 균형 잡힌 의사결정을 지원합니다.

## 주요 기능

### 📝 고민 관리

- 고민 등록 및 관리
- 고민 상태 추적 (진행중, 해결, 보관)
- 고민별 분석 이력 저장

### 🧠 논리 분석

- **비교 프레임워크**: 두 선택지를 체계적으로 비교
- **가중치 설정**: 자신에게 중요한 가치관에 가중치 부여
- **점수 매기기**: 각 항목별로 선택지에 점수 부여
- **시각적 결과**:
  - 파이 차트로 가중치 분포 확인
  - 막대 차트로 총점 비교
  - 상세한 항목별 분석표

### 🔮 직관 분석

- **타로 카드 리딩**: 22장의 메이저 아르카나 카드
- **카드 뒤집기 애니메이션**: 부드러운 3D 카드 뒤집기 효과
- **정/역방향 해석**: 각 카드의 양면적 의미 제공

## 기술 스택

### 프레임워크 & 언어

- Flutter (Dart)
- Material Design 3

### 상태 관리

- Riverpod 2.6.1

### 라우팅

- go_router 14.6.2

### 로컬 저장소

- Hive 2.2.3
- Hive Flutter 1.1.0

### 차트 시각화

- fl_chart 0.69.2
  - 파이 차트 (가중치 분포)
  - 막대 차트 (총점 비교)

### 다국어

- intl 0.20.1

### 유틸리티

- uuid 4.5.1
- path_provider 2.1.5

## 디자인 시스템

Choicely는 vocatch 프로젝트의 디자인 시스템을 기반으로 합니다:

### 컬러 팔레트

- **Primary**: #3182F7 (블루)
- **Mystical**: #6B46C1 (타로 테마용 퍼플)
- **Grey Scale**: 100부터 00까지 11단계

### 텍스트 스타일

- Headline 1-4
- Body Large/Medium/Small
- Label Large/Medium/Small
- Caption

### 스페이싱

- Base Unit: 4px
- xs(4px) ~ massive(48px)까지 체계적인 간격

## 프로젝트 구조

```
lib/
├── core/
│   ├── constants/          # 색상, 텍스트, 간격 상수
│   ├── theme/              # 앱 테마 정의
│   ├── animations/         # 공통 애니메이션 위젯
│   └── router/             # 라우팅 설정
├── features/
│   ├── concern/            # 고민 관리
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   ├── logical_framework/  # 논리 분석
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   └── intuitive_advice/   # 직관 분석
│       ├── data/
│       ├── screens/
│       └── widgets/
└── main.dart
```

## 애니메이션

### 화면 전환

- 슬라이드 + 페이드 전환 효과
- 부드러운 ease-in-out 커브

### 카드 뒤집기

- 3D 회전 애니메이션
- Transform.rotateY 활용
- 800ms 부드러운 전환

### 리스트 진입

- 순차적 SlideIn 애니메이션
- 각 아이템 50ms 지연

## 시작하기

### 설치

```bash
# 의존성 설치
flutter pub get

# Hive TypeAdapter 생성
dart run build_runner build --delete-conflicting-outputs
```

### 실행

```bash
flutter run
```

### 빌드

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 사용 방법

1. **고민 추가**: 메인 화면에서 "고민 추가" 버튼 클릭
2. **분석 방법 선택**:
   - **논리 분석**: 체계적인 비교와 점수화
   - **직관 분석**: 타로 카드 리딩
3. **결과 확인**: 시각적 차트와 상세 분석 확인

## 개발 가이드

### 코드 생성

Hive TypeAdapter가 필요한 경우:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 분석

```bash
flutter analyze
```

## 라이선스

MIT License

## 기여

이 프로젝트는 개인 프로젝트입니다.

---

Made with ❤️ using Flutter
