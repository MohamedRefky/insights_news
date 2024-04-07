import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/features/home/presentation/manager/News_cubit.dart';
import 'package:insights_news/features/home/presentation/manager/News_state.dart';

class NewsSearchBiulder extends StatefulWidget {
  const NewsSearchBiulder({
    super.key,
  
  });
  
  @override
  State<NewsSearchBiulder> createState() => _NewsSearchBiulderState();
}

class _NewsSearchBiulderState extends State<NewsSearchBiulder> {
  @override
 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsBySearchSuccessState) {
          var news = state.model.articles;

          return ListView.builder(
            itemCount: news?.length,
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
                      child: Image.network(
                        news?[index].urlToImage ?? '',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                              width: 150,
                              height: 100,
                              child: Icon(
                                Icons.error,
                                color: AppColors.grey,
                              ));
                        },
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news?[index].title ?? '',
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
                                news?[index].author ?? '',
                                style: getSmallStyle(
                                    color: AppColors.white, fontSize: 13),
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
        } else if (state is NewsBySearchErrorState) {
          return const Text('Eror');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
