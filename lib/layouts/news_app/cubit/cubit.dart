import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/news_app/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/home/home.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sport_screen.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import '../../../modules/settings/settings_screen/setting_screens.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.phone_iphone), label: 'Technology'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.rocket_outlined), label: 'Science'),
    BottomNavigationBarItem(
        icon: Icon(Icons.manage_accounts_outlined), label: 'Profile'),
  ];

  List<Widget> screens = [
    HomeScreen(),
    BusinessScren(),
    SportScreen(),
    ScienceScreen(),
    SettindsScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> headlines = [];
  void getheadlines() {
    emit(NewsLoadingheadlinesState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'apiKey': '6e5b0f2f15e34834ac1bb4123cf3aa6d',
    }).then((value) {
      headlines = value.data["articles"];
      emit(NewsGetheadlinesSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetheadlinesErorrState(error.toString()));
    });
  }

  //noteeeeee : replaced business to technology !
  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingBusinessState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'technology',
      'apiKey': '6e5b0f2f15e34834ac1bb4123cf3aa6d',
    }).then((value) {
      business = value.data["articles"];
      emit(NewsGetBusinessSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErorrState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsLoadingSportState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'gb',
      'category': 'sports',
      'apiKey': '6e5b0f2f15e34834ac1bb4123cf3aa6d',
    }).then((value) {
      sports = value.data["articles"];
      emit(NewsGetSportSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportErorrState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsLoadingScienceState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '6e5b0f2f15e34834ac1bb4123cf3aa6d',
    }).then((value) {
      science = value.data["articles"];
      emit(NewsGetScienceSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErorrState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;

    emit(AppChangeModeState());
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsLoadingSearchState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '6e5b0f2f15e34834ac1bb4123cf3aa6d',
    }).then((value) {
      search = value.data["articles"];
      emit(NewsGetSearchSucessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErorrState(error.toString()));
    });
  }
}
