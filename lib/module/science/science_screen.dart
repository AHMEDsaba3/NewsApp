import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constans/components.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/state.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
    listener: (context, state) {},
    builder: (context, state) {
      var cubit = NewsCubit.get(context);
      if (cubit.science.isNotEmpty) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: cubit.science.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildArticleItem(
                context: context,
                  author: cubit.science[index]['author'],
                  link: cubit.science[index]['url'],
                  title: cubit.science[index]['title'],
                  date: cubit.science[index]['publishedAt'],
                  imageLink: cubit.science[index]['urlToImage'] ??
                      'https://static.vecteezy.com/system/resources/previews/008/281/489/non_2x/no-photos-line-icon-vector.jpg'),
            );
          },

        );
      } else
        return Center(child: CircularProgressIndicator());
    },
  );

  }
}
