import 'package:mobile/base/base_event.dart';
import 'package:mobile/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);
}
