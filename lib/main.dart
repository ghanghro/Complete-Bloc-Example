import 'package:block_example/bloc/image_picker_example/image_picker_bloc.dart';
import 'package:block_example/posts/post_screen.dart';
import 'package:block_example/repository/favourite_repository.dart';
import 'package:block_example/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'bloc/favourite_app/favourite_app_bloc.dart';
import 'bloc/posts/posts_bloc.dart';
import 'bloc/switch_Example/switch_bloc.dart';
import 'bloc/todo/todo_example_bloc.dart';
import 'favourite_example/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context) => CounterBloc(),),
         BlocProvider(create: (context) => SwitchBloc(),),
         BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
         BlocProvider(create: (context) => TodoBloc()),
         BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
         BlocProvider(create: (context) => PostsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
         // home: const CounterScreen(),
         // home: const SwitchScreen(),
         //  home: const ImagePickerScreen(),
         //  home: const ToDoScreen(),
         //  home: const FavouriteScreen(),
          home: const PostScreen(),
      ),
    );
  }
}


