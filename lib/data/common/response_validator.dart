import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../common/exeptions.dart';

mixin HttpResponseValidator {
  void ValidateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppExeptions(message: "${response.statusCode}");
    } else {
      debugPrint("response is validate");
    }
  }
}
