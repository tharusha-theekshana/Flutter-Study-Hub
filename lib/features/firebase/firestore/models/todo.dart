import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  bool isUpdated;

  Todo({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.isUpdated,
  });

  // Convert firestore doc to Todo model type
  factory Todo.fromJson(Map<String, dynamic> doc, String id) {
    return Todo(
      id: id,
      name: doc['name'],
      createdAt: _convertToDateTime(doc['createdAt']),
      updatedAt: _convertToDateTime(doc['updatedAt']),
      isUpdated: doc['isUpdated'],
    );
  }

  // Covert Todo model type to firestore doc
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdAt':
      createdAt is Timestamp ? createdAt : Timestamp.fromDate(createdAt),
      'updatedAt':
      updatedAt is Timestamp ? updatedAt : Timestamp.fromDate(updatedAt),
      'isUpdated': isUpdated,
    };
  }

  // Covert firestore Timestamp to DateTime
  static DateTime _convertToDateTime(dynamic timestamp) {
    if (timestamp == null) {
      throw ArgumentError('Timestamp cannot be null');
    }

    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is DateTime) {
      return timestamp;
    } else {
      throw ArgumentError(
          'Unsupported timestamp type: ${timestamp.runtimeType}');
    }
  }
}