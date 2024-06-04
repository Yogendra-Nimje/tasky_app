import 'package:flutter/material.dart';
import 'package:tasky_app/Util/dialog_box.dart';
import 'package:tasky_app/Util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {


  //task name controller

  final  _controller= TextEditingController();

  //methode list of task
  List toDolist=[
    ["First Task",false],
    ["Second Task",true]
  ];

  // checkbox was tapped
  void checkedBox(bool? value,int index){
    setState(() {
      toDolist[index][1]=!toDolist[index][1];
    });
  }


  //save New Task

  void saveNewTask(){
    setState(() {
      toDolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }


  //create New Task
  void createNewTask(){
    showDialog(context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: ()=>Navigator.of(context).pop(),
          );
        });
  }


  // delete tasks
  void deleteTask(int index){
    setState(() {
      toDolist.removeAt(index);
    });
  }


  //edit Tasks

  void edittask(int index){
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To Do Tasks",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        elevation: 0,
        backgroundColor: Colors.purple[300],
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.purple[400],
        onPressed: createNewTask,
         child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: ListView.builder(
        itemCount: toDolist.length,
        itemBuilder: (context,index){
          return ToDoTile(
              taskname: toDolist[index][0],
              taskcomplete: toDolist[index][1],
              onChanged: (value)=> checkedBox(value,index),
              deletefunction: (context) => deleteTask(index),
              editfunction: (context) => edittask(index),
          );
        },
      ),
    );
  }
}
