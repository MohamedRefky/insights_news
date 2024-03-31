import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/routing.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/core/widgets/nav_bar_widget.dart';
import 'package:insights_news/features/Upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // delay with 3 sec. and navigate to upload view ..
    final isUpload = AppLocalStorage.getCachedData('isUpload') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(
          context, isUpload ? const NavBarWidget() : const UploadView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE
          Image.asset('assets/logo.png'),
          const Gap(10),
          Text(
            'Insights News',
            style: getTitleStyle(color: AppColors.primary, fontSize: 22),
          ),

          const Gap(10),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getSmallStyle(),
          ),
        ],
      )),
    );
  }
}
