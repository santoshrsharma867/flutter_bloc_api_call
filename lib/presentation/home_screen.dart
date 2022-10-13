import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second',
                    arguments: {'title': "The HELLO World"});
              },
              icon: Icon(Icons.forest))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserLoadedState) {
            return Center(
              child: ListView.builder(
                  itemCount: state.userModel.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.teal,
                        title: Text(
                            state.userModel.data![index].firstName.toString()),
                        subtitle:
                            Text(state.userModel.data![index].email.toString()),
                        leading: CircleAvatar(
                          radius: 30,
                          child: Image.network(
                              state.userModel.data![index].avatar.toString()),
                        ),
                      ),
                    );
                  }),
            );
          }
          if (state is UserErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
