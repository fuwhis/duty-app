import 'package:flutter/material.dart';
import 'package:mobile/bloc/todo_bloc.dart';
import 'package:mobile/event/add_todo_event.dart';
import 'package:mobile/event/delete_todo_event.dart';
import 'package:provider/provider.dart';

class TodoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
            child: TextFormField(
          controller: txtTodoController,
          decoration: InputDecoration(labelText: 'Add task', hintText: ''),
        )),
        SizedBox(width: 20),
        RaisedButton.icon(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtTodoController.text));
          },
          icon: Icon(Icons.add),
          label: Text('Add'),
        ),
      ],
    );
  }
}
