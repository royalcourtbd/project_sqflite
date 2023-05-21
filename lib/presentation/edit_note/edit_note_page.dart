import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/data/employee_model.dart';
import 'package:project_sqflite/presentation/edit_note/edit_note_presenter.dart';

class EditNotePage extends StatelessWidget {
  EditNotePage({super.key, this.employeeModel});
  EmployeeModel? employeeModel = EmployeeModel();
  final EditNotePresenter _editNotePresenter = Get.put(EditNotePresenter());

  late TextEditingController titleController =
      TextEditingController(text: employeeModel?.name ?? '');

  late TextEditingController description =
      TextEditingController(text: employeeModel?.designation ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        centerTitle: true,
      ),
      body: Form(
        key: _editNotePresenter.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please provide title';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editNotePresenter.note.name = newValue;
                  _editNotePresenter.note.designation = newValue;
                },
                decoration: const InputDecoration(hintText: 'Note Title'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLines: 5,
                controller: description,
                onSaved: (newValue) {
                  _editNotePresenter.note.designation = newValue;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please provide description';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Note Description',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  employeeModel?.id != null
                      ? _editNotePresenter.editNote(
                          employee: employeeModel?.copyWith(
                            name: titleController.text,
                            designation: description.text,
                          ),
                          onEdited: () => Get.back<void>(),
                        )
                      : _editNotePresenter.insertNote(
                          onLoading: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Dialog(
                                  child: SizedBox(
                                    height: 100,
                                    // width: 100,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                );
                              },
                            );

                            await Future.delayed(const Duration(seconds: 1));
                            Get.back();
                          },
                          employeeModel: EmployeeModel(
                            id: DateTime.now().microsecondsSinceEpoch,
                            name: titleController.text,
                            designation: description.text,
                          ),
                          onInserted: () async {
                            Get.back();
                          });
                },
                child:
                    Text(employeeModel?.id == null ? 'Save Note' : 'Edit Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
