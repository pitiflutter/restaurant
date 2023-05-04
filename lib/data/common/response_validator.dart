import 'package:http/http.dart';

import '../../common/exeptions.dart';

mixin HttpResponseValidator {
  void ValidateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppExeptions();
    }
  }
}
