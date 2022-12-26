import 'dart:convert';
import 'package:attendance/models/todo.dart';
import 'package:http/http.dart' as http;

class CalendarService {
  String baseURL = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> getCalendar() async {
    List<Todo> dataCalendar = [];
    var url = Uri.parse('$baseURL/todos');
    var response = await http.get(url);
    var body = json.decode(response.body);

    for (var i = 0; i < body.length; i++) {
      dataCalendar.add(Todo.fromJson(body[i]));
    }
    return dataCalendar;
  }
}
