part of 'post_bloc_bloc.dart';

@immutable
abstract class PostBlocState {}

class PostBlocInitial extends PostBlocState {}

class PostLoadedState extends PostBlocState {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

class PostErrorState extends PostBlocState {
  final String message;

  PostErrorState(this.message);
}
