
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState  extends Equatable{
  final XFile? file;
  final XFile? file1;
  const ImagePickerState({this.file,this.file1});
   ImagePickerState copyWith({XFile? file,XFile? file1}){
    return ImagePickerState(file: file?? this.file,file1: file1 ?? this.file1);
}
  @override
  List<Object?> get props => [file,file1];
}
