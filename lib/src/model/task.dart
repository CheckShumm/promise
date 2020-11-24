
import 'dart:ffi';

class Task {

  // constructor
  Task(String title) {
    _ID = new Uint64();
    _title = title;
  }

  //********* Public Methods **********//
  String getTitle() { return _title; }

  //********* Private Members **********//
  Uint64 _ID;
  String _title;
  String _description;
}