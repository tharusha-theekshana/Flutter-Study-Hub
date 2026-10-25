import 'package:flutter_study_hub/features/testing/sections/unit_testing/models/todo.dart';
import 'package:flutter_study_hub/features/testing/sections/unit_testing/services/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late TodoService _service;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  group("Todo service Tests", () {
    test("Test get todo functionality", ()  async {
      _service = TodoService();
      final todo = Todo(id: "1", title: "Test todo", isCompleted: false);

      await _service.addTodo(todo);
      final List<Todo> todos = await _service.getTodos();

      expect(todos.length,1);
      expect(todos[0].id, "1");
    });

    test("Test update todo functionality", () async {
      _service = TodoService();
      final todo = Todo(id: "2", title: "Test todo", isCompleted: false);
      await _service.addTodo(todo);

      var updatedTodo = todo.copyWith(title: 'Updated Title');
      await _service.updateTodo(updatedTodo);

      final List<Todo> todos = await _service.getTodos();
      expect(todos.length,2);
      expect(todos[1].title, "Updated Title");
    });

    test("Test delete todo functionality", () async {
      _service = TodoService();
      final todo = Todo(id: "3", title: "Test todo", isCompleted: false);
      await _service.addTodo(todo);
      await _service.deleteTodo(todo.id);

      final List<Todo> todos = await _service.getTodos();
      expect(todos.length,2);
    });
  });
}
