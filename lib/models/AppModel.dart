import 'package:image_picker/image_picker.dart';
import 'package:o_rider/models/FileModel.dart';
import 'package:o_rider/models/TaskViewModel.dart';
import 'package:o_rider/services/DataService.dart';
import 'package:o_rider/services/StorageService.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  final DataService _dataService = DataService();
  final StorageService _storageService = StorageService();
  List<TaskViewModel> tasks = [];
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
    selectedTask = task;
    notifyListeners();
  }

  void loadLocation(Function callback) {
    tasks[selectedTask].loadLocation((bool loading, bool error) {
      notifyListeners();
      callback(loading, error);
    });
  }

  void uploadFile(XFile file, int fileIndex, String type) {
    tasks[selectedTask].files.add(FileModel(
          status: FileStatus.uploading,
          url: "",
          thumb: "",
          type: type,
          progress: 0,
        ));
    _storageService.uploadFile(file, (double progress) {
      tasks[selectedTask].files[fileIndex].progress = progress;
      notifyListeners();
    }, (String url) async {
      String thumb = type == 'video'
          ? await _storageService.generateThumbnailUrl(file)
          : url;
      tasks[selectedTask].files[fileIndex] = FileModel(
        status: FileStatus.loaded,
        url: url,
        thumb: thumb,
        type: type,
        progress: 100,
      );
      notifyListeners();
    }, () {});
  }

  void handleSubmit(int index, Function callback) {
    tasks[index].submitting = true;
    notifyListeners();
    callback(true, false);
    _dataService.submitTask(tasks[index]).then((value) {
      tasks[index].submitting = false;
      callback(false, false);
      tasks.removeAt(index);
      notifyListeners();
    }).catchError((e) {
      tasks[index].submitting = false;
      notifyListeners();
      callback(false, true);
    });
  }
}
