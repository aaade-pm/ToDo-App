import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/models/dialog_box.dart';
import 'package:todo_app/models/task_tile.dart';
import 'package:todo_app/views/todopage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('mybox');

  //create an instance for the class that stores data
  final db = TaskDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //if user is just using the app for the first time meaning there is nothing to get from the database
    if (_myBox.get('TODOLIST') == null) {
      //load the default
      db.createInitialDatabase();
    } else {
      //this is not the user's first time then get data
      db.loadData();
    }
  }

  // the controllers for the new task and description textfields
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  //To operate the checkbox
  void completed(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      // update the changes to the database
      db.updateData();
    });
  }

  //The bool is meant to check is empty and display error message
  // But i have not learnt state management
  bool? isError = false;

  //if user clicks on the save button then run this
  void addNewTask() {
    final taskNameText = _controller.text;
    //if it is not empty return false, add new input to database, update database, clear controller and return to homepage
    // else, return true, clear controllers and return to homepage
    if (taskNameText.isNotEmpty) {
      setState(() {
        isError = false;
        db.toDoList.add([_controller.text, false, _controller2.text]);
        db.updateData();
        _controller.clear();
        _controller2.clear();

        Navigator.of(context).pop();
      });
    } else {
      isError = true;
      _controller.clear();
      _controller2.clear();

      Navigator.of(context).pop();
    }
  }

  //if user click on the cancel button then run this
  void cancelNewTask() {
    setState(() {
      _controller.clear();
      _controller2.clear();

      Navigator.of(context).pop();
    });
  }

  //if user clicks on the delete slidable button, run this
  void deleteFunction(context, int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        centerTitle: true,
        elevation: 0,
        title: Text(
          'T O  D O  A P P',
          style: GoogleFonts.ptSerif(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // onpressed of the floating action button pop up a dialog box
          showDialog(
              context: context,
              builder: (context) {
                return DialogBox(
                  controller: _controller,
                  controller2: _controller2,
                  addTask: addNewTask,
                  cancelTask: cancelNewTask,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TodoPage(
                        description: db.toDoList[index][2],
                        taskName: db.toDoList[index][0],
                      ),
                    ),
                  );
                },
                child: TaskTile(
                  isCompleted: db.toDoList[index][1],
                  onChanged: (value) => completed(value, index),
                  taskDescription: db.toDoList[index][2].toString(),
                  taskTitle: db.toDoList[index][0],
                  onPressedAction: (BuildContext) {
                    deleteFunction(context, index);
                  },
                ),
              ),
            );
          }),
    );
  }
}
