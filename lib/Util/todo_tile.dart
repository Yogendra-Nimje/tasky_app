import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {

  final String taskname;
  final bool taskcomplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  Function(BuildContext)? editfunction;

   ToDoTile({super.key,
    required this.taskname,
    required this.taskcomplete,
    required this.onChanged,
    required this.deletefunction,
    required this.editfunction,


  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.edit,
              backgroundColor: Colors.green.shade300,
              onPressed: widget.editfunction,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              onPressed:widget.deletefunction,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Row(
              children: [
                //checkbox
                Checkbox(value: widget.taskcomplete,
                    onChanged: widget.onChanged,
                    activeColor: Colors.purple[200] ,),
                //Task name
                Text(
                    widget.taskname,
                  style: TextStyle(
                    fontSize: 18,
                    decoration:widget.taskcomplete ?
                        TextDecoration.lineThrough:
                        TextDecoration.none
                    ),
              ),
              ],
            )
        ),
      ),
    );
  }
}