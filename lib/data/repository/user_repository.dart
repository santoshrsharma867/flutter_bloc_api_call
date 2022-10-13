import 'dart:convert';

import 'package:api_bloc/data/model/user_model.dart';
import 'package:api_bloc/data/repository/api_provider.dart';
import 'package:api_bloc/error/base_controller.dart';

class UserRepository extends BaseController{
  Future<UserModel> getJoke() async {
    final response = await ApiProvider().getJoke().catchError(handleError);

    if (response != null) {
      return UserModel.fromJson(response);
    }
    return UserModel.fromJson(response);
  }
}
