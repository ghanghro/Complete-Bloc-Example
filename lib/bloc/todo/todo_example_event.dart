
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class  TodoAddEvent extends TodoEvent {
  final String task;
  const TodoAddEvent(this.task);
  @override
  List<Object?> get props => [];
}

class RemoveTodoAddEvent extends TodoEvent {
  final Object? index;
  const RemoveTodoAddEvent(this.index);
  @override
  List<Object?> get props => [];
}
