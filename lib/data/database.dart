import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  //reference the box
  final _myBox = Hive.box('mybox');

  //what data are managing?
  List toDoList = [];

  //If this is the first time using the app
  void createInitialDatabase() {
    toDoList = [
      ['Welcome to my TODO App', false, ' dfjnsnfkvk'],
    ];
  }

  // load up already create task whenever user opens the app
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update database whenever user makes changes
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
  }
}
