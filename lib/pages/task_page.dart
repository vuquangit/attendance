import 'package:attendance/services/calendar.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _todoService = TodoService();

  Widget _title() {
    return const Text('Task page');
  }

  Widget _todoList() {
    return FutureBuilder(
        future: _todoService.getTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          return ListView.separated(
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var todo = snapshot.data?[index];

                return Container(
                  // height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${todo?.id}')),
                      Expanded(flex: 3, child: Text('${todo?.title}')),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _todoList(),
          ],
        ),
      ),
    );
  }
}
