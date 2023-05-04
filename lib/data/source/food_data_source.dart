import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restaurant/common/exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/data/common/response_validator.dart';
import 'package:restaurant/data/repo/food_repository.dart';

import '../model/food.dart';

abstract class IFoodDataSource {
  Future<List<Food>> getAll();
}

class FoodRemoteDataSource
    with HttpResponseValidator
    implements IFoodDataSource {
  final http.Client httpClient;

  FoodRemoteDataSource(this.httpClient);

  @override
  Future<List<Food>> getAll() async {
    final response =
        await httpClient.get(Uri.parse("http://10.0.2.2:8080/foods"), headers: {
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6InBpdGkxMzgxMzBAZ21haWwuY29tIiwiRmlyc3RfbmFtZSI6IkhhbWVkIiwiTGFzdF9uYW1lIjoiTWFobW9vZGkiLCJVaWQiOiI2NDRjZTY5YTY0ODM5ZGRjNmI4OWRhOTMiLCJVc2VyX3R5cGUiOiJBRE1JTiIsImV4cCI6MjA0MzA1OTgwM30.YBh2Ul_qlXJ38zaaCDZf3L9qXOp4fwIPIC4rOADv2eM"
    });
    ValidateResponse(response);
    List<Food> result = <Food>[];

    result = (json.decode(response.body) as List)
        .map((element) => Food.fromJson(element))
        .toList();
     return result;
  }
}
