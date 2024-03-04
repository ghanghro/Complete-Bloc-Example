
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()){
    on<CameraCapture>(_imageCapture);
    on<GalleryCapture>(_pickImageFromGallery);
  }

  void _imageCapture(CameraCapture event, Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture()  ;
    emit(state.copyWith(file: file));
  }
  void _pickImageFromGallery(GalleryCapture event, Emitter<ImagePickerState> emit)async{
    XFile? file1 = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file1: file1));
  }
}
