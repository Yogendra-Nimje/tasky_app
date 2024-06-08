import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky_app/Util/dialog_box.dart';
import 'package:tasky_app/Util/todo_tile.dart';
import 'package:tasky_app/data/database.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  Box? _myBox;
  // Reference to the Hive box
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    // Initialize the Hive box and load data
    Hive.openBox('mybox').then((box) {
      _myBox = box;
       // db._myBox = _myBox; // Set the box in ToDoDatabase
      if (_myBox!.get('TODOLIST') == null) {
        db.createInitialData();
        db.updateDataBase(); // Save the initial data to the box
      } else {
        db.loadData();
      }
      setState(() {}); // Refresh the UI after loading data
    });
  }

  final _controller = TextEditingController();

  // Checkbox was tapped
  void checkedBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Delete tasks
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // Edit tasks
  void editTask(int index) {
    // Implementation for editing tasks can be added here
  }

  @override
  Widget build(BuildContext context) {
    if (_myBox == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "To Do Tasks",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: createNewTask,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.toDoList[index][0],
            taskcomplete: db.toDoList[index][1],
            onChanged: (value) => checkedBox(value, index),
            deletefunction: (context) => deleteTask(index),
            editfunction: (context) => editTask(index),
          );
        },
      ),
    );
  }
}
