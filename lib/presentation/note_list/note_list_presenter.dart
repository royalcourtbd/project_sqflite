import 'package:get/get.dart';
import 'package:project_sqflite/data/database_helper.dart';
import 'package:project_sqflite/data/employee_model.dart';
import 'package:project_sqflite/presentation/note_list/note_list_ui_state.dart';

class NoteListPresenter extends GetxController {
  Rx<NoteListUiState> uiState = Rx(NoteListUiState(
    isLoading: false,
    employeeList: const [],
  ));

  Future<void> fetchNoteList() async {
    _loading();
    final List<EmployeeModel> employeeMapList =
        await DatabaseHelper.getAllEmployee();
    uiState.value =
        uiState.value.copyWith(employeeList: employeeMapList, isLoading: false);
  }

  Future<void> deleteNote({required EmployeeModel employeeModel}) async {
    final id = employeeModel.id;
    DatabaseHelper.deleteDatabase(id!);
  }

  @override
  void onInit() {
    super.onInit();
    fetchNoteList();
  }

  void _loading() => uiState.value = uiState.value.copyWith(isLoading: true);
  void _loaded() => uiState.value = uiState.value.copyWith(isLoading: false);
}
