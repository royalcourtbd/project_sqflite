import 'package:project_sqflite/data/employee_model.dart';

class NoteListUiState {
  final bool isLoading;
  final List<EmployeeModel> employeeList;

  NoteListUiState({
    required this.isLoading,
    required this.employeeList,
  });

  NoteListUiState copyWith({
    bool? isLoading,
    List<EmployeeModel>? employeeList,
  }) {
    return NoteListUiState(
      isLoading: isLoading ?? this.isLoading,
      employeeList: employeeList ?? this.employeeList,
    );
  }
}
