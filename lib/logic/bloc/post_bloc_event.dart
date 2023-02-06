// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'post_bloc_bloc.dart';

@immutable
abstract class PostBlocEvent {}

class FetchDataEvent extends PostBlocEvent {
  final List<PostModel> posts;

  FetchDataEvent(this.posts);
}
