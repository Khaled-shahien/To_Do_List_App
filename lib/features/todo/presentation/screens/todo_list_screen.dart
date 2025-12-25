import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/todo/domain/entities/todo_item.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({super.key});

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<ToDoItem> _toDoItems = [];
  final TextEditingController _textController = TextEditingController();

  void _addToDoItem() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _toDoItems.add(ToDoItem(title: _textController.text));
      });
      _textController.clear();
    }
  }

  void _toggleToDoItem(int index) {
    setState(() {
      _toDoItems[index].isCompleted = !_toDoItems[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To-Do List',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
      ),
      body: _toDoItems.isEmpty ? _buildEmptyState() : _buildToDoList(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.checklist_outlined,
            size: 100,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            'No tasks yet!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Add a task using the button below',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildToDoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
        itemCount: _toDoItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = _toDoItems[index];
          return _buildToDoItemCard(item, index);
        },
      ),
    );
  }

  Widget _buildToDoItemCard(ToDoItem item, int index) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: item.isCompleted
              ? Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
              : Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Theme.of(context).colorScheme.primary,
              ),
              child: Checkbox(
                value: item.isCompleted,
                onChanged: (bool? value) {
                  _toggleToDoItem(index);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: item.isCompleted
                      ? FontWeight.w400
                      : FontWeight.w500,
                  decoration: item.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                  color: item.isCompleted
                      ? Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5)
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            if (item.isCompleted)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        _showAddTaskDialog();
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Task'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add New Task',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Enter task...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            onSubmitted: (value) {
              _addToDoItem();
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                _addToDoItem();
                Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
