// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names, lendsTasksrary_private_types_in_public_api, unused_element, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:Dumpi/dataBase/StoragesUtils.dart';
import 'package:flutter/material.dart';
import '../appAppearance/AppAppearance.dart';
import '../controller/tasksController/TasksController.dart';

import '../dataBase/Task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList({required this.tasks});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasksCopy = [];
  int checked = 0;
  AppAppearance app = AppAppearance();

  @override
  void initState() {
    super.initState();
    tasksCopy = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    tasksCopy.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          itemCount: indexIconFooter == 0
              ? tasksCopy
                  .where((task) =>
                      task.getFind() == true && task.statut == 'false')
                  .length
              : tasksCopy
                  .where(
                      (task) => task.statut == 'true' && task.getFind() == true)
                  .length,
          itemBuilder: (context, i) {
            Task task = indexIconFooter == 0
                ? tasksCopy
                    .where((task) =>
                        task.getFind() == true && task.statut == 'false')
                    .toList()[i]
                : tasksCopy
                    .where((task) =>
                        task.statut == 'true' && task.getFind() == true)
                    .toList()[i];
            return Container(
              margin: EdgeInsets.all(10),
              height: 140,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: app.appearance(light, themes).tertiaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,  
                        style: TextStyle(
                          color: app.appearance(light, themes).secondlyColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        task.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                task.statut =
                                    task.statut == 'true' ? 'false' : 'true';
                                Future<void> fast() async {
                                  for (int i = 0; i < tasksCopy.length; i++) {
                                    if (tasksCopy[i].id == task.getId()) {
                                      tasksCopy[i].statut = task.statut;
                                      break;
                                    }
                                  }
                                  await StoragesUtils.saveTasks(tasksCopy);
                                  tasks = await StoragesUtils.getTasks();
                                }

                                fast();
                              });
                            },
                            child: task.statut == 'true'
                                ? Icon(Icons.check,
                                    color: app
                                        .appearance(light, themes)
                                        .secondlyColor)
                                : Icon(Icons.timelapse,
                                    color: app
                                        .appearance(light, themes)
                                        .secondlyColor),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Future<void> fast() async {
                                  tasksCopy.removeWhere((element) =>
                                      element.getId() == task.getId());
                                  await StoragesUtils.saveTasks(tasksCopy);
                                  tasks = await StoragesUtils.getTasks();
                                }

                                fast();
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 116, 64, 64),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => TasksController(
                                            opperation: 'show',
                                            title: task.title,
                                            description: task.description,
                                            time: '')));
                              },
                              child: Icon(
                                Icons.remove_red_eye_rounded,
                                color: Color.fromARGB(255, 6, 129, 129),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => TasksController(
                                            opperation: 'update',
                                              title: task.title,
                                            description: task.description,
                                              time: task.createdAt,
                                            )));
                              },
                              child: Icon(Icons.edit,
                                  color: light ? Colors.black : Colors.white))
                        ],
                      ),
                      Row(children: [
                        Spacer(),
                        Text(task.createdAt),
                      ])
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
