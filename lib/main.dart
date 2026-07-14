import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
   await Hive.openBox<BookEntity>(KFeaturedBox);
   await Hive.openBox<BookEntity>(KNewestBox);

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
