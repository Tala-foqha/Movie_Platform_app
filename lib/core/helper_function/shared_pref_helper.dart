// core/helper_function/shared_pref_helper.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/helper_function/constants.dart';
import 'package:movie_platform_app/features/search/data/model/recent_movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;

  SharedPrefHelper._();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> removeData(String key) async {
    debugPrint(
      'SharedPrefHelper : data with key : $key has been removed',
    );
    await _prefs?.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint(
      'SharedPrefHelper : all data has been cleared',
    );
    await _prefs?.clear();
  }

  static Future<void> setData(
    String key,
    dynamic value,
  ) async {
    debugPrint(
      "SharedPrefHelper : setData with key : $key and value : $value",
    );

    switch (value.runtimeType) {
      case String:
        await _prefs?.setString(key, value);
        break;

      case int:
        await _prefs?.setInt(key, value);
        break;

      case bool:
        await _prefs?.setBool(key, value);
        break;

      case double:
        await _prefs?.setDouble(key, value);
        break;

      default:
        return;
    }
  }

  // =========================
  // Recent Movies
  // =========================

  static Future<void> saveRecentMovies(
    List<RecentMovieModel> movies,
  ) async {
    final data = movies
        .map(
          (movie) => jsonEncode(movie.toJson()),
        )
        .toList();

    await _prefs?.setStringList(
      SharedPrefKeys.recentMovies,
      data,
    );
  }

  static List<RecentMovieModel> getRecentMovies() {
    final data = _prefs?.getStringList(
          SharedPrefKeys.recentMovies,
        ) ??
        [];

    return data
        .map(
          (movie) => RecentMovieModel.fromJson(
            jsonDecode(movie),
          ),
        )
        .toList();
  }

static Future<void> saveSelectedCategories(
  List<String> categories,
) async {
  final jsonData = jsonEncode(categories);

  await _prefs?.setString(
    SharedPrefKeys.selectedCategories,
    jsonData,
  );
}

static List<String> getSelectedCategories() {
  final data = _prefs?.getString(
    SharedPrefKeys.selectedCategories,
  );

  if (data == null || data.isEmpty) {
    return [];
  }

  final decoded = jsonDecode(data);

  return List<String>.from(decoded);
}
  // =========================
  // Get values
  // =========================

  static bool getBool(String key) =>
      _prefs?.getBool(key) ?? false;

  static double getDouble(String key) =>
      _prefs?.getDouble(key) ?? 0.0;

  static int getInt(String key) =>
      _prefs?.getInt(key) ?? 0;

  static String getString(String key) =>
      _prefs?.getString(key) ?? '';
}