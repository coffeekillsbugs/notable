import 'package:flutter/material.dart';

class Note {
  int _id;
  String _body;
  Color _color;

  Note(this._body, this._color,[this._id]);

  int get id => _id;
  String get body => _body;
  Color get color => _color;

  set id(int newID) {
    this._id = newID;
  }

  set body(String newBody) {
    this._body = newBody;
  }

  set color(Color newColor) {
    this._color = newColor;
  }

  //* Convert Note into a map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'body': _body,
      'color': _color,
    };
  }

  //* Extract a note object from map object
  Note.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._body = map['body'];
    this._color = map['color'];
  }
}
