part of 'post_cubit_cubit.dart';

@immutable
abstract class PostCubitState {}

class PostCubitInitial extends PostCubitState {}

class PostLoadedState extends PostCubitState {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

class PostErrorState extends PostCubitState {
  final String message;

  PostErrorState(this.message);
}
