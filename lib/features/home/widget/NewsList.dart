import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';

class NewsListBiulder extends StatelessWidget {
  const NewsListBiulder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              color: AppColors.containerBg,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/rodry.png',
                  fit: BoxFit.fill,
                  width: 150,
                  height: 100,
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Man City stay perfect despite Rodri red against Forest',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle(),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: AppColors.white,
                          size: 17,
                        ),
                        const Gap(10),
                        Text(
                          'READ',
                          style: getSmallStyle(
                              color: AppColors.white, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}