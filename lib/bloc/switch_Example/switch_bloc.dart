

import 'package:bloc/bloc.dart';
import 'package:block_example/bloc/switch_Example/switch_Event.dart';
import 'package:block_example/bloc/switch_Example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc(): super(SwitchState()){
    on<EnableOrDisableNotification>(_notification);
    on<SliderEvent>(_slider);
  }

  void _notification(EnableOrDisableNotification event, Emitter<SwitchState> emit){
    emit(state.copyWidth(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState>emit){
    emit(state.copyWidth(slider: event.slider));
  }
}