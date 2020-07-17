class TodoItemModel {
  String text;
  bool isDone;
  int position;

  TodoItemModel({this.isDone = false, this.text, this.position = 0});
}

List<TodoItemModel> todoItem = [
  TodoItemModel(
    isDone: false,
    text: 'Toothbrush',
  ),
  TodoItemModel(
    isDone: false,
    text: 'Paste',
  ),
  TodoItemModel(
    isDone: false,
    text: 'Lays',
  ),
  TodoItemModel(
    isDone: false,
    text: 'Deodrant',
  ),
  TodoItemModel(
    isDone: true,
    text: 'Biscuits',
  ),
  TodoItemModel(
    isDone: true,
    text: 'Cake',
  ),
  TodoItemModel(
    isDone: true,
    text: 'Sugar',
  ),
  TodoItemModel(
    isDone: true,
    text: 'Rice',
  ),
];
