import 'package:api_handling/data/models/post_model.dart';
import 'package:api_handling/data/repositories/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostRepository postRepository = PostRepository();
  late List<PostModel> posts;

  PostBlocBloc() : super(PostBlocInitial()) {
    on<FetchDataEvent>((event, emit) async {
      try {
        List<PostModel> posts = await postRepository.fetchPosts();

        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
