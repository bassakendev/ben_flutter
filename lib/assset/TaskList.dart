// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names, lendsTasksrary_private_types_in_public_api, unused_element, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

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
    tasksCopy.sort((a, b) => b.getId().compareTo(a.getId()));
    return Expanded(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
          itemCount: indexIconFooter == 0
              ? tasksCopy
                  .where((task) =>
                      task.getFind() == true && task.getStatut() == false)
                  .length
              : tasksCopy
                  .where((task) =>
                      task.getStatut() == true && task.getFind() == true)
                  .length,
          itemBuilder: (context, i) {
            Task task = indexIconFooter == 0
                ? tasksCopy
                    .where((task) =>
                        task.getFind() == true && task.getStatut() == false)
                    .toList()[i]
                : tasksCopy
                    .where((task) =>
                        task.getStatut() == true && task.getFind() == true)
                    .toList()[i];
            return Container(
              margin: EdgeInsets.all(10),
              height: 130,
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
                        // task.titre,
                        task.title,
                        style: TextStyle(
                          color: app.appearance(light, themes).secondlyColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        task.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                task.setStatut();
                              });
                            },
                            child: task.getStatut()
                                ? Icon(Icons.check,
                                    color: app
                                        .appearance(light, themes)
                                        .secondlyColor)
                                : Text('En attente...',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 6, 59, 102))),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                tasksCopy.removeWhere(
                                    (element) => element.id == task.getId());
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
                                            titre: task.title,
                                            description: task.description,
                                            id: 0)));
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
                                            titre: task.title,
                                            description: task.description,
                                            id: task.getId())));
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
