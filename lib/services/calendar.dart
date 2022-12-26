import 'dart:convert';
import 'package:http/http.dart' as http;

class Todo {
  int? userId;
  int? id;
  String? title;

  Todo({this.userId, this.id, this.title});
  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
}

class TodoService {
  String baseURL = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> getTodoList() async {
    List<Todo> todoList = [];
    var url = Uri.parse('$baseURL/todos');
    var response = await http.get(url);
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      todoList.add(Todo.fromJson(body[i]));
    }
    return todoList;
  }
}
