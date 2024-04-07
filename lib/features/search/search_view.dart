import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/features/home/presentation/manager/News_cubit.dart';
import 'package:insights_news/features/search/widget/new_Searh_Bilder.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Find Your News',
          style: getTitleStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              style: getBodyStyle(color: AppColors.grey),
              onChanged: (value) {
                context.read<NewsCubit>().getNewsBySearch(value);
              },
              cursorColor: AppColors.grey,
              decoration: InputDecoration(
                hintText: 'Search for news',
                hintStyle: getBodyStyle(color: AppColors.grey),
                filled: true,
                fillColor: AppColors.containerBg,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.grey,
                ),
                border: const UnderlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const Gap(20),
            const Row(
              children: [
                Gap(3),
              ],
            ),
            const Gap(10),
            const Expanded(child: NewsSearchBiulder())
          ],
        ),
      ),
    );
  }
}
