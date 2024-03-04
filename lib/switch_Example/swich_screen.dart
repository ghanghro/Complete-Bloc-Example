import 'package:block_example/bloc/switch_Example/switch_Event.dart';
import 'package:block_example/bloc/switch_Example/switch_bloc.dart';
import 'package:block_example/bloc/switch_Example/switch_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Example Two"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            const Text("Notification"),
               BlocBuilder<SwitchBloc,SwitchState>(builder: (context, state) {
                 return Switch(value: state.isSwitch, onChanged: (newValue){
                   const Text("Notification");
                   context.read<SwitchBloc>().add(EnableOrDisableNotification());
                });
              },),
             // const Text("Notification"),
             // Switch(value: true, onChanged: (newValue){}),
            ],
          ),
           const SizedBox(height: 30),
            BlocBuilder<SwitchBloc,SwitchState>(builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },),
            const SizedBox(height: 50),
            BlocBuilder<SwitchBloc,SwitchState>(builder: (context, state) {
              return Slider(value: state.slider, onChanged: (value){
                context.read<SwitchBloc>().add(SliderEvent(slider: value));
              });

            },),
          ],
        ),
      ),
    );
  }
}
