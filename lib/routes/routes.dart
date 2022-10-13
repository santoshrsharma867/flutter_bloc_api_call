import 'package:api_bloc/bloc/user_bloc/user_bloc.dart';
import 'package:api_bloc/bloc/user_bloc/user_event.dart';
import 'package:api_bloc/presentation/home_screen.dart';
import 'package:api_bloc/presentation/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route? generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(builder: ((context) {
          return BlocProvider(
            create: (context) => UserBloc()..add(LoadUserEvent()),
            child: Home(),
          );
        }));

      case "/second":
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(builder: ((context) {
          return SecondPage(title: arguments['title']);
        }));
    }
  }
}
