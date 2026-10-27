import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_study_hub/features/firebase/firestore/models/todo.dart';
import 'package:flutter_study_hub/features/firebase/firestore/services/todo_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String taskCollection = "tasks";
  late FakeFirebaseFirestore firestore;
  late TodoService todoService;

  setUp(() {
    firestore = FakeFirebaseFirestore();
    todoService = TodoService(firebaseFirestore: firestore);
  });

  group("Tests for Todo service", () {
    test("Test add task functionality to firestore", () async {
      const taskName = 'Test Task';
      await todoService.addTask(taskName);

      final querySnapshot = await firestore.collection(taskCollection).get();
      expect(querySnapshot.docs.length, 1);

      final addedTask = querySnapshot.docs.first;
      expect(addedTask.get('name'), taskName);
      expect(addedTask.get('isUpdated'), false);
    });

    test("Test get tasks functionality from firestore", () async {
      await firestore.collection(taskCollection).add({
        'name': 'Task 1',
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
        'isUpdated': false,
      });
      await firestore.collection(taskCollection).add({
        'name': 'Task 2',
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
        'isUpdated': false,
      });

      final tasksStream = todoService.getTasks();
      final tasks = await tasksStream.first;

      expect(tasks.length, 2);
      expect(tasks[0].name, "Task 1");
    });

    test("Test update tasks functionality from firestore", () async {
      DocumentReference ref = await firestore.collection('tasks').add({
        'name': 'Task 1',
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
        'isUpdated': false,
      });

      // Represent todo from json data
      Todo todo = Todo(
        id: ref.id,
        name: 'Task 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isUpdated: false,
      );

      // Modify the task
      final updatedTask = Todo(
        id: ref.id,
        name: 'Updated Task',
        createdAt: todo.createdAt,
        updatedAt: DateTime.now(),
        isUpdated: true,
      );

      await todoService.updateTask(updatedTask);

      final updatedDoc =
      await firestore.collection(taskCollection).doc(ref.id).get();

      expect(updatedDoc.get('name'), 'Updated Task');
    });

    test('Test delete task functionality from firestore', () async {
      final docRef = await firestore.collection(taskCollection).add({
        'name': 'Task to Delete',
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
        'isUpdated': false,
      });
      
      await todoService.deleteTask(docRef.id);

      final querySnapshot = await firestore.collection(taskCollection).get();
      expect(querySnapshot.docs.length, 0);
    });
  });
}
