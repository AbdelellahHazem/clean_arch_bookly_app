import 'package:clean_arch_bookly_app/core/utils/service_locator.dart';
import 'package:clean_arch_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {

   await Hive.initFlutter();
   Hive.registerAdapter(BookEntityAdapter());
   setupServiceLocator();
   await Hive.openBox<BookEntity>(KFeaturedBox);
   await Hive.openBox<BookEntity>(KNewestBox);
   Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context){
          return FeaturedBooksCubit(FetchFeaturedBookUsecase(
            getIt.get<HomeRepoImp>()
          ));
        } ),


        BlocProvider(create: (context){
          return NewestBooksCubit(FetchNewestBookUsecase(
            getIt.get<HomeRepoImp>()
          ));
        } ),

        
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
