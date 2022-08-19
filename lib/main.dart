// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/news_app/cubit/cubit.dart';
import 'package:newsapp/layouts/news_app/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import 'layouts/news_app/news_layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()
          ..getSports()
          ..getScience()
          ..getheadlines(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              iconTheme: IconThemeData(color: Color(0xff8561b1)),
              primarySwatch: buildMaterialColor(Color(0xff8561b1)),
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color(0xff8561b1),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                bodyText2: TextStyle(color: Colors.black, fontSize: 17),
              ),
              shadowColor: Colors.grey.withOpacity(0.2),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black, size: 32),
                
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xff8561b1),
                  elevation: 20.0),
            ),
            darkTheme: ThemeData(
              backgroundColor: Color(0xff1e1e1e),
              scaffoldBackgroundColor: Color(0xff121212),
              iconTheme: IconThemeData(color: Color(0xff8561b1)),
              primarySwatch: buildMaterialColor(Color(0xff8561b1)),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color(0xff8561b1),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                bodyText2: TextStyle(color: Colors.white, fontSize: 17),
              ),
              
              inputDecorationTheme: InputDecorationTheme(
                
               labelStyle: TextStyle(
                color: Colors.white,
                
               ),
               
               border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)), 
              ),
              shadowColor: Color.fromARGB(46, 0, 0, 0),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff121212),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xff121212),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.white, size: 32),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Color(0xff1f1f1f),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xff8561b1),
                  unselectedItemColor: Colors.white,
                  elevation: 20.0),
            ),
            themeMode: NewsCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
