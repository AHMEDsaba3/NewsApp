import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/layout/newsDetails.dart';

Widget buildArticleItem({required String title,required String date,required String imageLink,required String author,required String link,context}){
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Newsdetails(author: author, link: link),));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: NewsCubit.get(context).isDark?Color(0xFFb0b3b8):Colors.grey,spreadRadius: 1,blurRadius: 50,blurStyle: BlurStyle.inner,offset: Offset(0, 5))],
            color: NewsCubit.get(context).isDark?Color(0xFF3a3b3c):Colors.purple.shade300,
            borderRadius:  BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration:  BoxDecoration(
                  boxShadow:[BoxShadow(color: NewsCubit.get(context).isDark?Colors.grey:Colors.white38,blurRadius: 10)] ,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(imageLink),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 20,
              ),
               Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,maxLines: 3,overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      date,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
