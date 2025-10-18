import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/on_boarding/data/onboarding_model.dart';
import 'package:car_zone/features/on_boarding/presentation/view/widgets/dot_indecator_widget.dart';
import 'package:car_zone/features/on_boarding/presentation/view/widgets/onboarding_content_widget.dart';
import 'package:car_zone/features/on_boarding/presentation/view/widgets/text_skip_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _onboardingPages = [
    OnboardingModel(
      image: AppAssets.imagesFirstImageOnboarding,
      title: "اكتشف سيارتك المثالية",
      description:
          "تصفح مئات السيارات المعروضة من مختلف المحافظات بسهولة وسرعة، مع صور ومواصفات دقيقة تساعدك في اختيار الأفضل.",
    ),
    OnboardingModel(
      image: AppAssets.imagesSecondImageOnboarding,
      title: "مقارنة ذكية",
      description:
          "قارن بين السيارات المختلفة من حيث المواصفات والأسعار واختر ما يناسب ميزانيتك واحتياجاتك.",
    ),
    OnboardingModel(
      image: AppAssets.imagesThirdImageOnboarding,
      title: "تواصل مباشر",
      description:
          "تواصل مباشرة مع البائعين، حدد موعد للفحص واشتري سيارتك بثقة وأمان تام.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextSkipWidget(),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingPages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingContentWidget(page: _onboardingPages[index]);
                },
              ),
            ),
            DotIndecatorWidget(
              onboardingPages: _onboardingPages,
              currentPage: _currentPage,
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
