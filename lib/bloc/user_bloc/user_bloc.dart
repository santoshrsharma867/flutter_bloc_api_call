import 'package:api_bloc/bloc/user_bloc/user_event.dart';
import 'package:api_bloc/bloc/user_bloc/user_state.dart';
import 'package:api_bloc/data/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // final UserRepository _userRepository;
  UserBloc() : super(UserLoadingState()) {
    UserRepository userRepository = UserRepository();
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final joke = await userRepository.getJoke();
        print(joke);
        emit(UserLoadedState(joke));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
