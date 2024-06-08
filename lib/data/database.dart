import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // Reference to our box
  Box? _myBox;

  // Initialize and open the Hive box
  Future<void> initializeBox() async {
    _myBox = await Hive.openBox('mybox');
  }

  // Run this method if this is the 1st time opening this app
  void createInitialData() {
    toDoList = [
      ["2Hr Learning", false],
      ["Do Exercise", false]
    ];
    updateDataBase(); // Save the initial data to the box
  }

  // Load data from the database
  void loadData() {
    toDoList = _myBox!.get('TODOLIST', defaultValue: []);
  }

  // Update the database
  void updateDataBase() {
    _myBox!.put('TODOLIST', toDoList);
  }
}
