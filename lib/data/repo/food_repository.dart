import 'package:http/http.dart' as http;
import 'package:restaurant/data/source/food_data_source.dart';

import '../common/http_client.dart';
import '../model/food.dart';

abstract class IFoodRepository {
  Future<List<Food>> getAll();
}

final FoodRepository foodRepository =
    FoodRepository(FoodRemoteDataSource(httpClient));

class FoodRepository implements IFoodRepository {
  final IFoodDataSource dataSource;

  FoodRepository(this.dataSource);
  @override
  Future<List<Food>> getAll() async {
    return await dataSource.getAll();
  }
}
