import 'package:api_handling/logic/cubit/post_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API Handling"),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubitCubit, PostCubitState>(
          builder: (context, state) {
            print('states $state');
            if (state is PostCubitInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is PostLoadedState) {
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    state.posts[index].title.toString(),
                  ),
                );
              });
            }

            return const Text("error has occured");
          },
        ),
      ),
    );
  }
}
