import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layer_architecture_template/presentation/component/base_scaffold.dart';

import '../../../domain/todo/todo_notifier.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  static const String routeName = 'todo_List_Page';
  static const String routePath = '/todo_List_Page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(todoNotifierProvider.notifier);
    final state = ref.watch(todoNotifierProvider);

    return BaseScaffold(
      isShowAppBar: true,
      appBarTitle: 'Todo List Page',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () async {
                  final todoList = await notifier.fetchSampleModelList();
                  for (final todo in todoList) {
                    print(todo);
                  }
                },
                child: const Text('Isar Fetch TodoList'),
              ),
            ),
            state.futureTodoList.when(
              data: (data) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    // ここでfutureTodoListの値が取れる
                    (context, index) {
                      // これで単体データが取れる
                      final todo = data[index];
                      return Card(
                        child: ListTile(
                          title: Text(todo.name),
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                );
              },
              error: (e, s) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('error'),
                  ),
                );
              },
              loading: () {
                // ローディングはここ
                return SliverToBoxAdapter(
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      height: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
