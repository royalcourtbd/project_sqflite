import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/data/database_helper.dart';
import 'package:project_sqflite/data/employee_model.dart';
import 'dart:developer' as dev;

class EditNotePresenter extends GetxController {
  final formKey = GlobalKey<FormState>();
  Future<void> insertNote({
    required EmployeeModel? employeeModel,
    required VoidCallback onInserted,
  }) async {
    if (employeeModel == null) return;
    final note = employeeModel.toJson();
    dev.log(note.toString());

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      DatabaseHelper.insertData(databaseTableName, note);
      onInserted();
    }
  }

  Future<void> editNote(
      {required EmployeeModel? employee,
      required VoidCallback onEdited}) async {
    if (employee == null) return;
    final employeeMap = employee.toJson();
    DatabaseHelper.updateDatabase(employeeMap);
    onEdited();
  }

  final note = EmployeeModel();

  // void saveNote(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();

  //     DatabaseHelper.insertData(databaseTableName, note.toJson()).then((value) {
  //       if (value > 0) {
  //         print(value);
  //       }
  //     }).catchError((error) => print(error));

  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return const Dialog(
  //           child: SizedBox(
  //             height: 100,
  //             // width: 100,
  //             child: Center(child: CircularProgressIndicator()),
  //           ),
  //         );
  //       },
  //     );

  //     await Future.delayed(const Duration(seconds: 1));

  //     Navigator.of(context).pop();
  //     Navigator.of(context).pop();
  //   } else {
  //     throw Exception('Could not save');
  //   }
  // }
//  EmployeeModel? employeeModel = EmployeeModel();
//   void editNoteMethod(BuildContext context) async {
//     await DatabaseHelper.updateDatabase({
//       databaseEmployeeTableColumnId: employeeModel?.id,
//       databaseEmployeeTableColumnName: titleController.text,
//       databaseEmployeeTableColumnDesignation: description.text
//     });
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const Dialog(
//           child: SizedBox(
//             height: 100,
//             // width: 100,
//             child: Center(child: CircularProgressIndicator()),
//           ),
//         );
//       },
//     );

//     await Future.delayed(const Duration(seconds: 1));

//     Navigator.of(context).pop();
//     Navigator.of(context).pop();
//   }
}
