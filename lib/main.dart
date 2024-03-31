import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/coloes.dart';
import 'package:insights_news/features/Upload/upload_view.dart';
import 'package:insights_news/features/home/presentation/manager/News_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const UploadView(),
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.background,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.grey,
              ))),
    );
  }
}
