import 'package:equatable/equatable.dart';

class SwitchState extends Equatable{
  bool isSwitch;
  final double slider;
  SwitchState({this.isSwitch = false,this.slider = 1.0});
  SwitchState copyWidth({bool? isSwitch,double? slider}){
    return SwitchState(isSwitch: isSwitch?? this.isSwitch,slider: slider?? this.slider);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch];

}