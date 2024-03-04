import 'package:block_example/bloc/posts/posts_bloc.dart';
import 'package:block_example/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts/posts_event.dart';
import '../bloc/posts/posts_state.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("Api Example"),
      ),
      body: BlocBuilder<PostsBloc,PostsState>(builder: (context, state){
        switch(state.postStatus){
          case PostStatus.loading:
           return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return ListView.builder(
              itemCount:  state.postList.length,
              itemBuilder: (context, index) {
              final item = state.postList[index];  
              return  ListTile(
                title:Text(item.email.toString()),
                subtitle: Text(item.body.toString()),
              );
            },);
        }
       }
      ),
    );
  }
}