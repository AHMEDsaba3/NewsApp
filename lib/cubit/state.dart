abstract class NewsState{}
class NewsInitialState extends NewsState{}
class NewsBottomNavState extends NewsState{}
class GetBusinessLoadingState extends NewsState{}
class BusinessGetData extends NewsState{}
class BusinessErrorData extends NewsState{
  final String error;

  BusinessErrorData(this.error);
}

class GetSportsLoadingState extends NewsState{}
class SportsGetData extends NewsState{}
class SportsErrorData extends NewsState{
  final String error;

  SportsErrorData(this.error);
}

class GetScienceLoadingState extends NewsState{}
class ScienceGetData extends NewsState{}
class ScienceErrorData extends NewsState{
  final String error;

  ScienceErrorData(this.error);
}
