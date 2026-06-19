import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RouterX on BuildContext {
  String get currentRoute =>
      GoRouterState.of(this).uri.toString();

  String get currentPath =>
      GoRouterState.of(this).uri.path;

  String get currentRoot {
    final path = currentPath;
    if(path.startsWith('/')){
      final list = path.split('/');
      if(list.length > 1){
        return '/'+list[1];
      }
      return '/';
    }else{
      final root = path.split('/').first;
      return root.isEmpty?'/':'/$root';
    }
  }
}