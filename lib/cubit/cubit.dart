import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/state.dart';
import 'package:newsapp/module/business/business_screen.dart';
import 'package:newsapp/module/science/science_screen.dart';
import 'package:newsapp/module/settings/setting_screen.dart';
import 'package:newsapp/module/sports/sports_screen.dart';
import 'package:newsapp/network/remote/dio_hellper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: "business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_football),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Setting",
    ),
  ];

  List<Widget> Screens=[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingScreen()

];

  void changeBottomNavBar(int index){
    currentIndex= index;
    if(index==1){
      GetSportsData();
    }
    if(index==2){
      GetScienceData();
    }
    emit(NewsBottomNavState());
  }

  List business =[];

  void GetBusinessData(){
    emit(GetBusinessLoadingState());

    DioHellper.GetData(url: 'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apiKey':'60bbe4ea00cc452eb61124bdc1df8066'
    }).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);

      emit(BusinessGetData());
    },).catchError((error){
      print(error.toString());
      emit(BusinessErrorData(error.toString()));
    });
  }

  List sports =[];

  void GetSportsData(){
    if(sports.isEmpty){  //to call data by once
      emit(GetSportsLoadingState());
      DioHellper.GetData(url: 'v2/top-headlines', query:{
        'country':'eg',
        'category':'sports',
        'apiKey':'60bbe4ea00cc452eb61124bdc1df8066'
      }).then((value) {
        sports=value.data['articles'];
        print(sports[0]['title']);

        emit(SportsGetData());
      },).catchError((error){
        print(error.toString());
        emit(SportsErrorData(error.toString()));
      });
    }else{
      emit(SportsGetData());
    }

  }

  List science =[];

  void GetScienceData(){
    if(science.isEmpty){
      emit(GetScienceLoadingState());

      DioHellper.GetData(url: 'v2/top-headlines', query:{
        'country':'eg',
        'category':'science',
        'apiKey':'60bbe4ea00cc452eb61124bdc1df8066'
      }).then((value) {
        science=value.data['articles'];
        print(science[0]['title']);

        emit(ScienceGetData());
      },).catchError((error){
        print(error.toString());
        emit(ScienceErrorData(error.toString()));
      });
    }else{
      emit(ScienceGetData());
    }

  }

  bool isDark=false;

  void ToggleIsDark(){
    isDark= !isDark;
    emit(AppThemeState());
  }


}