import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/core/widgets/custom_btn.dart';
import 'package:insights_news/features/home/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDetailsView extends StatelessWidget {
  const newsDetailsView({super.key, required this.artical});

  final Article artical;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primary),
        ),
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15),
            child: CustomButton(
              color: AppColors.primary,
              text: 'Go To Website',
              onPressed: () async {
                var url = Uri.parse(artical.url ?? '');
                await launchUrl(url);
              },
            )),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(artical.urlToImage ?? ''),
                ),
                const Gap(15),
                Text(
                  artical.title ?? '',
                  style: getBodyStyle(),
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      artical.author ?? '',
                      style: getSmallStyle(color: AppColors.primary),
                    ),
                    const Spacer(),
                    Text(
                      DateTime.tryParse(artical.publishedAt ?? '')
                              ?.toIso8601String()
                              .split('T')[0] ??
                          '',
                      style: getSmallStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  artical.description ?? '',
                  style: getBodyStyle(color: AppColors.grey),
                ),
              ],
            )));
  }
}
