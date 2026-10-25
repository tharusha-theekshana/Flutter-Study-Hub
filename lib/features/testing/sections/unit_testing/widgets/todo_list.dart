import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) onDelete;
  final Function(String) onEdit;
  final VoidCallback onRefresh;

  const TodoList({
    super.key,
    required this.todos,
    required this.onDelete,
    required this.onRefresh,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      itemCount: todos.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () => onEdit(todo.id),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    // Leading status/icon indicator
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.task_alt_rounded,
                        size: 20,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Task Title
                    Expanded(
                      child: Text(
                        todo.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Action Buttons
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          color: Colors.grey.shade600,
                          tooltip: 'Edit task',
                          onPressed: () => onEdit(todo.id),
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          icon: const Icon(Icons.delete_outline_rounded, size: 20),
                          color: Colors.red.shade400,
                          tooltip: 'Delete task',
                          onPressed: () => onDelete(todo.id),
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}