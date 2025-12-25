import 'package:flutter_test/flutter_test.dart';

import 'package:to_do_list_app/main.dart';

void main() {
  testWidgets('To Do List App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ToDoApp());

    expect(find.text('To-Do List'), findsOneWidget);
  });
}
