import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constans/components.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/state.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if (cubit.sports.isNotEmpty) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: cubit.sports.length,
            itemBuilder: (context, index) {
              return buildArticleItem(
                context: context,
                  author: cubit.sports[index]['author'],
                  link: cubit.sports[index]['url'],
                  title: cubit.sports[index]['title'],
                  date: cubit.sports[index]['publishedAt'],
                  imageLink: cubit.sports[index]['urlToImage'] ??
                      'https://cdn-icons-png.flaticon.com/128/11542/11542598.png');
            },
          );
        } else
          return Container(child: Center(child: CircularProgressIndicator()));
      },
    );

  }
}
