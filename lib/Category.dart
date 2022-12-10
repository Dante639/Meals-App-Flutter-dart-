import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color coLor;

 const Category({
    required this.title,
    required this.id,
    this.coLor = Colors.black87,
  });
}