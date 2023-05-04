
import 'package:http/http.dart' as http;
import 'package:restaurant/data/source/food_data_source.dart';

import '../common/http_client.dart';
import '../model/food.dart';
import '../source/food_detail_data_source.dart';

abstract class IFoodDetailRepository {
  Future<FoodDetail> getAll({required String foodId});
}
 
final FoodDetailRepository foodDetailRepository = FoodDetailRepository(FoodDetailRemoteDataSource(httpClient));
class FoodDetailRepository implements IFoodDetailRepository {
  final IFoodDetailDataSource dataSource;

  FoodDetailRepository(this.dataSource);
  @override
  Future<FoodDetail> getAll({required String foodId}) async {
    return await dataSource.getAll(foodId: foodId);
  }
}
