import 'package:api_handling/logic/cubit/post_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ScrollController controller = ScrollController();

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
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels >
                          (notification.metrics.maxScrollExtent / 2) &&
                      controller.position.userScrollDirection ==
                          ScrollDirection.reverse) {
                    print("Load more -------------------");
                  }
                  return false;
                },
                child: ListView.builder(
                  controller: controller,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.posts[index].title.toString(),
                      ),
                    );
                  },
                  itemCount: state.posts.length,
                ),
              );
            }

            return const Text("error has occured");
          },
        ),
      ),
    );
  }
}
