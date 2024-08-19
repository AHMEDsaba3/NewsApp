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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildArticleItem(title: cubit.sports[index]['title'],
                    date: cubit.sports[index]['publishedAt'],
                    imageLink: cubit.sports[index]['urlToImage'] ??
                        'https://static.vecteezy.com/system/resources/previews/008/281/489/non_2x/no-photos-line-icon-vector.jpg'),
              );
            },
          );
        } else
          return Container(child: Center(child: CircularProgressIndicator()));
      },
    );

  }
}
