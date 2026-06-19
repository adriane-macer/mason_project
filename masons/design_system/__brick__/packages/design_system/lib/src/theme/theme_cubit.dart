import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_package/core.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._localStorage) : super(ThemeMode.system) {
    _loadTheme();
  }

  final LocalStorage _localStorage;
  static const _themeKey = 'app_theme_mode';

  Future<void> _loadTheme() async {
    final savedTheme = await _localStorage.read(key: _themeKey);
    if (savedTheme != null) {
      final mode = ThemeMode.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeMode.system,
      );
      emit(mode);
    }
  }

  Future<void> updateTheme(ThemeMode mode) async {
    await _localStorage.write(key: _themeKey, value: mode.name);
    emit(mode);
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await updateTheme(newMode);
  }
}
