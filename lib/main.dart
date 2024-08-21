import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/BlocObserver.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/state.dart';
import 'package:newsapp/layout/homepage.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_hellper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHellper.init();
  await CacheHelper.init();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});
  bool isDark=CacheHelper.getData(key: 'isDark')??false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..GetBusinessData(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            ////////////////////////////////light Mode ///////////////////////////////////
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  elevation: 20),
              textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 20,
                      fontWeight:FontWeight.w600,
                      color: Colors.white
                  )
              ),
              scaffoldBackgroundColor: Colors.white,
              colorSchemeSeed: Colors.deepPurple,
              useMaterial3: true,
            ),

            ////////////////////////////////Dark Mode ///////////////////////////////////
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.black,
                    titleSpacing: 20,
                    elevation: 0.0,
                    titleTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color(0xFF18191a),
                    selectedItemColor: Colors.cyan,
                    type: BottomNavigationBarType.fixed, elevation: 20),
                colorSchemeSeed: Colors.cyan,
                scaffoldBackgroundColor:Colors.black,
                useMaterial3: true,
                textTheme: TextTheme(
                    bodyLarge: TextStyle(
                        fontSize: 20,
                        fontWeight:FontWeight.w600,
                        color: Colors.white
                    )
                )
            ),
            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const Homepage(),
          );
        },
      ),
    );
  }
}

//333739