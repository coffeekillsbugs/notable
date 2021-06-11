// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigma_note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteTypeAdapter extends TypeAdapter<NoteType?> {
  @override
  final int typeId = 3;

  @override
  NoteType? read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoteType.note;
      case 1:
        return NoteType.todo;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, NoteType? obj) {
    switch (obj) {
      case NoteType.note:
        writer.writeByte(0);
        break;
      case NoteType.todo:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SigmaNoteAdapter extends TypeAdapter<SigmaNote> {
  @override
  final int typeId = 1;

  @override
  SigmaNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SigmaNote(
      title: fields[0] as String?,
      dateCreated: fields[1] as DateTime?,
      noteType: fields[2] as NoteType?,
      noteBody: fields[3] as String?,
      todoItems: (fields[4] as List?)?.cast<TodoItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SigmaNote obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.dateCreated)
      ..writeByte(2)
      ..write(obj.noteType)
      ..writeByte(3)
      ..write(obj.noteBody)
      ..writeByte(4)
      ..write(obj.todoItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SigmaNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoItemModelAdapter extends TypeAdapter<TodoItemModel> {
  @override
  final int typeId = 2;

  @override
  TodoItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoItemModel(
      todoItem: fields[0] as String?,
      isDone: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoItemModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.todoItem)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
