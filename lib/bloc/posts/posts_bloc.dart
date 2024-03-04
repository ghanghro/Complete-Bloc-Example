import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_example/bloc/posts/posts_event.dart';
import 'package:block_example/bloc/posts/posts_state.dart';
import 'package:block_example/utils/enum.dart';
import '../../repository/posta_repository.dart';


class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsRepository postsRepository = PostsRepository();
  PostsBloc() : super(const PostsState()){
     on<PostFetched>(fetchPostApi);
  }
  void fetchPostApi(PostFetched event, Emitter<PostsState> emit) async {
   await postsRepository.fetchPost().then((value){
      emit(state.copyWith(postStatus: PostStatus.success, message: "Success", postList: value));
    }).onError((error, stackTrace){
      print(error);
      print(stackTrace);
      emit(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
