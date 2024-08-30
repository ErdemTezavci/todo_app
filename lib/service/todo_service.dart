import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/model/todo.dart';

class TodoService {
  final String url = "https://dummyjson.com/todos/";

  Future<List<Todo>> getTodos() async {
    final Response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(Response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((element){
      todos.add(Todo.fromJson(element));
    });

    return todos;
  }
}