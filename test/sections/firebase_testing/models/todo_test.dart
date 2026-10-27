import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_study_hub/features/firebase/firestore/models/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test creation functionality of firebase connected Todo model", () {
    final now = Timestamp.now();

    final todo = Todo(
      id: "1",
      name: "Test todo",
      createdAt: now.toDate(),
      updatedAt: now.toDate(),
      isUpdated: false,
    );

    expect(todo.id, "1");
    expect(todo.name, "Test todo");
    expect(todo.createdAt, isA<DateTime>());
  });


  test("Test functionality convert firebase doc to Todo model", () {
    final now = Timestamp.now();

    final todoFromJsonWithTimestamp = Todo.fromJson({
      "name": "test todo",
      "createdAt": now,
      "updatedAt": now,
      "isUpdated": false,
    }, "1");

    expect(todoFromJsonWithTimestamp.id, "1");
    expect(todoFromJsonWithTimestamp.createdAt, isA<DateTime>());
    expect(todoFromJsonWithTimestamp.updatedAt, isA<DateTime>());

    final todo = Todo(
      id: "1",
      name: "Test todo",
      createdAt: now.toDate(),
      updatedAt: now.toDate(),
      isUpdated: false,
    );

    final todoToJson = todo.toJson();
    expect(todoToJson["name"], "Test todo");
    expect(todoToJson["createdAt"], isA<Timestamp>());
    expect(todoToJson["updatedAt"], isA<Timestamp>());
    expect(todoToJson["isUpdated"], false);
  });
}
