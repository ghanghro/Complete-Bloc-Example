import 'dart:io';
import 'package:block_example/bloc/image_picker_example/image_picker_bloc.dart';
import 'package:block_example/bloc/image_picker_example/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_picker_example/image_picker_event.dart';
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         title:  const Text("Image Picker Example"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context, state){
            if(state.file == null){
              return GestureDetector(
                onTap: (){
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.camera,size: 40,),
                ),
              );
              }else{
               return Image.file(File(state.file!.path.toString()),height: 150,width: 100,);
            }
           },),
            BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context, state){
            if(state.file1 == null){
              return GestureDetector(
                onTap: (){
                  context.read<ImagePickerBloc>().add(GalleryCapture());
                },
                child: const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.camera_alt,size: 40,),
                ),
              );
              }else{
               return Image.file(File(state.file1!.path.toString()),height: 150,width: 100,);
            }
           },),
        ],),
      ),
    );
  }
}
