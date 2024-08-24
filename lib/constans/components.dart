import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newsapp/constans/focusnode.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/layout/newsDetails.dart';

Widget buildArticleItem(
    {required String title,
    required String date,
    required String imageLink,
    required String author,
    required String link,
    context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Newsdetails(author: author, link: link),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: NewsCubit.get(context).isDark
                      ? const Color(0xFFb0b3b8)
                      : Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 50,
                  blurStyle: BlurStyle.inner,
                  offset: const Offset(0, 5))
            ],
            color: NewsCubit.get(context).isDark
                ? const Color(0xFF333739)
                : Colors.purple.shade300,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: NewsCubit.get(context).isDark
                              ? Colors.grey
                              : Colors.white38,
                          blurRadius: 10)
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(imageLink), fit: BoxFit.cover)),
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
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white60),
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

double heightR(double x, BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  return x / 844 * h;
}

double widthR(double x, BuildContext context) {
  var w = MediaQuery.of(context).size.width;
  return x / 390 * w;
}

double sizeR(double x, BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return x / 326160 * w * h;
}

Widget defultTextForm(
    {required BuildContext context,
    required TextEditingController Controller,
    required String label,
    required TextInputType keyboardType,
    IconData? preIcon,
    IconData? sufIcon,
    bool ispassword = false,
    String? Function(String?)? validator,
    void Function(String)? onChangedFun,
    void Function(String)? onFieldSubmitted,
    Function()? suffixPressed,
    int? maxLine,
    double? radius,
    double? widthRe,
    double? heightRe,
    bool readonly = false,
    FocusNode? focusNode,
    int? minLine}) {
  return SizedBox(
    width: widthRe != null ? widthR(widthRe, context) : null,
    height: heightRe != null ? widthR(heightRe, context) : null,
    child: TextFormField(
      maxLines: maxLine ?? 1,
      minLines: minLine,
      keyboardType: keyboardType,
      onChanged: onChangedFun,
      validator: validator,
      autovalidateMode:
          validator != null ? AutovalidateMode.onUserInteraction : null,
      controller: Controller,
      obscureText: ispassword,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
              fontSize: sizeR(15, context),
              color: Color(0xff80000000),
              fontWeight: FontWeight.bold),
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 17))),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: preIcon != null ? Icon(preIcon) : null,
        ),
        prefixIconConstraints: BoxConstraints.tightFor(),
        suffixIcon: sufIcon != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(sufIcon))
            : null,
      ),
      readOnly: readonly == true ? true : false,
      focusNode: focusNode,
      enableInteractiveSelection: readonly == true ? false : true,
      onFieldSubmitted: onFieldSubmitted,
    ),
  );
}
