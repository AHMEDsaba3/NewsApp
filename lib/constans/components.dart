import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildArticleItem({required String title,required String date,required String imageLink}){
  return Container(
    decoration: BoxDecoration(
      boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 1,blurRadius: 50,blurStyle: BlurStyle.inner,offset: Offset(0, 5))],
        color: Colors.purple.shade300,
        borderRadius:  BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration:  BoxDecoration(
              boxShadow:[BoxShadow(color: Colors.grey,spreadRadius: 1,blurRadius: 20)] ,
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white),maxLines: 3,overflow: TextOverflow.ellipsis,
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
  );
}
