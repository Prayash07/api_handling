import 'package:api_handling/data/models/post_model.dart';
import 'package:api_handling/data/repositories/post_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_cubit_state.dart';

class PostCubitCubit extends Cubit<PostCubitState> {
  PostRepository postRepository = PostRepository();

  PostCubitCubit() : super(PostCubitInitial());

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
