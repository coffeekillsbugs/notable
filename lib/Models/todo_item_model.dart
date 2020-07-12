class TodoItemModel {
  String text;
  bool isDone;

  TodoItemModel(this.isDone, this.text);
}

List<TodoItemModel> todoItem = [
  TodoItemModel(
    false,
    'Toothbrush',
  ),
  TodoItemModel(
    false,
    'Paste',
  ),
  TodoItemModel(
    false,
    'Lays',
  ),
  TodoItemModel(
    false,
    'Deodrant',
  ),
  TodoItemModel(
    true,
    'Biscuits',
  ),
  TodoItemModel(
    true,
    'Cake',
  ),
  TodoItemModel(
    true,
    'Sugar',
  ),
  TodoItemModel(
    true,
    'Rice',
  ),
];