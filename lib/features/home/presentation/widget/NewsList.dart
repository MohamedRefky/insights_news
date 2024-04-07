import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/routing.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/core/utils/text_styels.dart';
import 'package:insights_news/features/home/presentation/manager/News_cubit.dart';
import 'package:insights_news/features/home/presentation/manager/News_state.dart';
import 'package:insights_news/features/home/presentation/view/news_details_view.dart';

class NewsListBiulder extends StatefulWidget {
  const NewsListBiulder({
    super.key,
    required this.Category,
  });
  final String Category;
  @override
  State<NewsListBiulder> createState() => _NewsListBiulderState();
}

class _NewsListBiulderState extends State<NewsListBiulder> {
  @override
  void initState() {
    context.read<NewsCubit>().getNewsByCategory(widget.Category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsByCategorySuccessState) {
          var news = state.model.articles;

          return ListView.builder(
            itemCount: news?.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateTo(context,  newsDetailsView(artical: news![index],));
                },
                child: Container(
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
                ),
              );
            },
          );
        } else if (state is NewsByCategoryErrorState) {
          return const Text('Eror');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
