import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<bool> {
  ThemeCubit() : super(true);

  void toggleTheme({required bool isDarkMode}) {
    emit(isDarkMode);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['isDarkMode'] as bool?;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'isDarkMode': state};
  }
}
