

import 'package:equatable/equatable.dart';
import '../../model/postsmodel.dart';
import '../../utils/enum.dart';

class PostsState extends Equatable {

  final PostStatus postStatus;
   final List<PostModel> postList;
   final String message;

   const PostsState({this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
   this.message = '',
  });

  PostsState copyWith({PostStatus? postStatus,List<PostModel>? postList,String? message}){
   return PostsState(postStatus: postStatus?? this.postStatus,
   postList: postList?? this.postList,
   message: message?? this.message,
   );

}
  @override
  List<Object?> get props => [postList, postStatus,message];

}

