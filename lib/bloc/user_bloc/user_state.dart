import 'package:api_bloc/data/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final UserModel userModel;

  UserLoadedState(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
