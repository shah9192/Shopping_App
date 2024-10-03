import 'package:flutter/material.dart';
class Product {
  final String image, name, description;
  final int price ;
  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}