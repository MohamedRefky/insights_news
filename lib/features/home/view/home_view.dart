import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/features/home/widget/NewsList.dart';
import 'package:insights_news/features/home/widget/home_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const HomeHeader(),
                const Gap(15),
                CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset('assets/rodry.png');
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentSlider = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentSlider),
                  count: 4,
                  effect: ScrollingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.primary),
                ),
                const Gap(15),
                ButtonsTabBar(
                  // Customize the appearance and behavior of the tab bar
                  backgroundColor: AppColors.primary,
                  unselectedBackgroundColor: AppColors.containerBg,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  buttonMargin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  labelStyle: getBodyStyle(color: AppColors.black),
                  unselectedLabelStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  // Add your tabs here
                  tabs: const [
                    Tab(
                      text: 'Science',
                    ),
                    Tab(
                      text: 'Entertainment',
                    ),
                    Tab(
                      text: 'Sports',
                    ),
                    Tab(
                      text: 'Business',
                    ),
                  ],
                ),
                const Gap(10),
                const Expanded(
                    child: TabBarView(children: [
                  NewsListBiulder(),
                  NewsListBiulder(),
                  NewsListBiulder(),
                  NewsListBiulder(),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
