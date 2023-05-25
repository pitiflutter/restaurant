import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:restaurant/common/exeptions.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/data/common/response_validator.dart';
import 'package:restaurant/data/repo/food_repository.dart';

import '../model/food.dart';

abstract class IFoodDetailDataSource {
  Future<FoodDetail> getAll({required String foodId});
}

class FoodDetailRemoteDataSource
    with HttpResponseValidator
    implements IFoodDetailDataSource {
  final http.Client httpClient;

  FoodDetailRemoteDataSource(this.httpClient);

  @override
  Future<FoodDetail> getAll({required String foodId}) async {
    final response = await httpClient
        .get(Uri.parse("http://10.0.2.2:8080/foods/$foodId"), headers: {
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6InBpdGkxMzgxMzBAZ21haWwuY29tIiwiRmlyc3RfbmFtZSI6IkhhbWVkIiwiTGFzdF9uYW1lIjoiTWFobW9vZGkiLCJVaWQiOiI2NDRjZTY5YTY0ODM5ZGRjNmI4OWRhOTMiLCJVc2VyX3R5cGUiOiJBRE1JTiIsImV4cCI6MjA0MzA1OTgwM30.YBh2Ul_qlXJ38zaaCDZf3L9qXOp4fwIPIC4rOADv2eM"
    });
    ValidateResponse(response);
    debugPrint("detail getAll function done ");

    FoodDetail foodDetail = FoodDetail.fromJson(jsonDecode(response.body));
    return foodDetail;
  }
}
