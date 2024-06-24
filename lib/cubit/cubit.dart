import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/state.dart';
import 'package:newsapp/module/business/business_screen.dart';
import 'package:newsapp/module/science/science_screen.dart';
import 'package:newsapp/module/settings/setting_screen.dart';
import 'package:newsapp/module/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_football),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Setting",
    ),
  ];

  List<Widget> Screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen()

];
  void changeBottomNavBar(int index){
    currentIndex= index;
    emit(NewsButtomNavState());
  }

}