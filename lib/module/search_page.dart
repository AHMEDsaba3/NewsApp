import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/constans/components.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/state.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  var searchTextForm = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formkey,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: defultTextForm(
                      context: context,
                      Controller: searchTextForm,
                      label: 'Search',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (p0) {
                        cubit.GetSearchData(p0);
                      },
                      // onChangedFun: (p0) {
                      //   cubit.GetSearchData(p0);
                      // },
                    ),
                  ),
                  Expanded(child: SearchBody(state, cubit)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget SearchBody(state, NewsCubit cubit) {
    if (state is! GetSearchLoadingState) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: cubit.search.length,
        itemBuilder: (context, index) {
          return buildArticleItem(
            context: context,
            author: cubit.search[index]['author']??'removed',
            link: cubit.search[index]['url']??'removed',
            title: cubit.search[index]['title']??'removed',
            date: cubit.search[index]['publishedAt']??'removed',
            imageLink: cubit.search[index]['urlToImage'] ??
                'https://cdn-icons-png.flaticon.com/128/11542/11542598.png',
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
