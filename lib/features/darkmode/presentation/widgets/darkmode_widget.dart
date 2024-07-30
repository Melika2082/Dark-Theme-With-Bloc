import 'package:darktheme/features/darkmode/presentation/cubit/darkmode_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return SwitchListTile(
          value: isDarkMode,
          onChanged: (value) {
            BlocProvider.of<ThemeCubit>(context).toggleTheme(
              isDarkMode: value,
            );
          },
          title: const Text('Dark Mode'),
        );
      },
    );
  }
}
