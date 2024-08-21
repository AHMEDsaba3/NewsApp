import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dark mode"),
            Switch(value: NewsCubit.get(context).isDark, onChanged: (value) {
              NewsCubit.get(context).ToggleIsDark();
            },),
          ],
        )
        );
      },
    );
  }
}
