import '../repository/hive_provider.dart';
import '../models/sigma_note.dart';

class CompactTodoViewModel {
  void changeItemState(SigmaNote changeObject, int index) {
    HiveProvider modifyObject = HiveProvider();

    modifyObject.changeTodoItemState(changeObject, index);
  }
}