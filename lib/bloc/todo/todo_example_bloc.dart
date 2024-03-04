
import 'package:bloc/bloc.dart';
import 'package:block_example/bloc/todo/todo_example_event.dart';
import 'package:block_example/bloc/todo/todo_example_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todos = [];
  TodoBloc() : super(const TodoState()){
    on<TodoAddEvent>(_todoAddEvent);
    on<RemoveTodoAddEvent>(_removeTodoEvent);
  }
  void _todoAddEvent(TodoAddEvent event, Emitter<TodoState> emit){
    todos.add(event.task);
    emit(state.copyWith(todoList: List.from(todos)));
  }
  void _removeTodoEvent(RemoveTodoAddEvent event, Emitter<TodoState> emit){
    todos.remove(event.index!);
    emit(state.copyWith(todoList: List.from(todos)));
  }
}
