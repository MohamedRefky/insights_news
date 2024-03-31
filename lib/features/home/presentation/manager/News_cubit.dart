import 'package:bloc/bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/home/presentation/manager/News_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  // get by category

  getNewsByCategory(String category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(e.toString()));
    }
  }

//   getNewsBySource(String source) {
//     emit(NewsByCategoryLoadingState());
//     try {
//       ApiServices.getNewsBySource(source).then((value) {
//         emit(NewsByCategorySuccessState(value!));
//       });
//     } catch (e) {
//       emit(NewsByCategoryErrorState(e.toString()));
//     }
//   }
}