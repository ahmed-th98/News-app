abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsLoadingBusinessState extends NewsStates {}

class NewsGetBusinessSucessState extends NewsStates {}

class NewsGetBusinessErorrState extends NewsStates {
  final String error;

  NewsGetBusinessErorrState(this.error);
}

class NewsLoadingSportState extends NewsStates {}

class NewsGetSportSucessState extends NewsStates {}

class NewsGetSportErorrState extends NewsStates {
  final String error;

  NewsGetSportErorrState(this.error);
}

class NewsLoadingScienceState extends NewsStates {}

class NewsGetScienceSucessState extends NewsStates {}

class NewsGetScienceErorrState extends NewsStates {
  final String error;

  NewsGetScienceErorrState(this.error);
}

class NewsLoadingheadlinesState extends NewsStates {}

class NewsGetheadlinesSucessState extends NewsStates {}

class NewsGetheadlinesErorrState extends NewsStates {
  final String error;

  NewsGetheadlinesErorrState(this.error);
}

class AppChangeModeState extends NewsStates {}

class NewsLoadingSearchState extends NewsStates {}

class NewsGetSearchSucessState extends NewsStates {}

class NewsGetSearchErorrState extends NewsStates {
  final String error;

  NewsGetSearchErorrState(this.error);
}