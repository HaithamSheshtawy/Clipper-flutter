import 'package:eccomerce/core/const.dart';
import 'package:flutter/material.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel(
      {this.name, this.brand, this.color, this.desc, this.imgPath, this.price});

  static List<ShoeModel> list = [
    ShoeModel(
        name: 'Nike Air Jordan 1 Retro High',
        desc:
            'description of Nike Air Jordan 1 Retro High it is a nice Nike Air Jordan 1 Retro High really I like Nike Air Jordan 1 Retro High',
        price: 184,
        color: AppColors.blueColor,
        brand: 'Nike',
        imgPath: '1.png'),
    ShoeModel(
        name: 'Converse X OPI Chuck Tylor',
        desc:
            'description of Converse X OPI Chuck Tylor it is a nice Converse X OPI Chuck Tylor really I like Converse X OPI Chuck Tylor',
        price: 123,
        color: AppColors.yellowColor,
        brand: 'Converse',
        imgPath: '1.png'),
    ShoeModel(
        name: 'Nike Air Jordan 1 Retro High',
        desc:
            'description of Nike Air Jordan 1 Retro High it is a nice Nike Air Jordan 1 Retro High really I like Nike Air Jordan 1 Retro High',
        price: 135,
        color: AppColors.redColor,
        brand: 'Nike',
        imgPath: '1.png'),
  ];
}
