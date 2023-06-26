
import 'package:o_rider/models/Task.dart';
import 'package:o_rider/services/DataService.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  final DataService _dataService = DataService();
  List<Task> tasks = [];
  bool loadingInitial = true;
  int selectedTask = 0;

  AppModel() {
    loadInitialData();
  }

  void loadInitialData() async {
    tasks = await _dataService.fetchTasks();
    loadingInitial = false;

    notifyListeners();
  }

  void selectTask(int task) {
    this.selectedTask = task;
    notifyListeners();
  }
}
