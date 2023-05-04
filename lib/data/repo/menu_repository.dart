import 'package:restaurant/data/source/menu_data_source.dart';

import '../common/http_client.dart';
import '../model/menu.dart';

abstract class IMenuRepository {
  Future<List<Menu>> getAll();
}
 
final MenuRepository menuRepository =
    MenuRepository(MenuRemoteDataSource(httpClient));
class MenuRepository implements IMenuRepository {
  final IMenuDataSource dataSource;

  MenuRepository(this.dataSource);
  @override
  Future<List<Menu>> getAll() async {
    return await dataSource.getAll();
  }
}
