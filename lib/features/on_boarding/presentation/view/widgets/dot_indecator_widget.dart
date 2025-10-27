import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/helpers/shared_pref_helper.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/on_boarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DotIndecatorWidget extends StatelessWidget {
  const DotIndecatorWidget({
    super.key,
    required List<OnboardingModel> onboardingPages,
    required int currentPage,
    required PageController pageController,
  }) : _onboardingModels = onboardingPages,
       _currentPage = currentPage,
       _pageController = pageController;

  final List<OnboardingModel> _onboardingModels;
  final int _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xff212224), Color(0xff212224), Colors.transparent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingModels.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 32 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primaryColor
                          : Colors.grey[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: AppColors.primaryColor.withAlpha(80),
                  ),
                  onPressed: () async {
                    if (_currentPage == _onboardingModels.length - 1) {
                      getIt.get<SharedPrefHelper>().setOnboardingShown();
                      if (!context.mounted) return;
                      context.pushReplacementNamed(
                        AppRouterConst.loginViewRouteName,
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentPage == _onboardingModels.length - 1
                            ? "ابدأ الآن"
                            : "التالي",
                        style: context.textStyle.text18SemiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _currentPage == _onboardingModels.length - 1
                            ? const Icon(Icons.done_all_rounded, size: 20)
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
