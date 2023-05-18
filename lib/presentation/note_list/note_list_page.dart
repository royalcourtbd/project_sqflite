import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sqflite/presentation/edit_note/edit_note_page.dart';
import 'package:project_sqflite/presentation/note_list/note_list_presenter.dart';
import 'package:project_sqflite/presentation/note_list/note_list_ui_state.dart';

class NoteListPage extends StatelessWidget {
  NoteListPage({super.key});

  final NoteListPresenter _presenter = Get.put(NoteListPresenter());

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: _presenter,
      builder: (_) {
        final NoteListUiState uiState = _presenter.uiState.value;
        final users = uiState.employeeList;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'sqf lite',
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              await Get.to(() => EditNotePage());
              _presenter.fetchNoteList();
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.builder(
                  itemCount: users.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 2 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () async {
                        _presenter.deleteNote(employeeModel: users[index]);
                        await _presenter.fetchNoteList();
                      },
                      onTap: () async {
                        await Get.to(
                            () => EditNotePage(employeeModel: users[index]));
                        await _presenter.fetchNoteList();
                      },
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Note Id ${users[index].id!}'),
                            Text(users[index].name!),
                            Text(users[index].designation!),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
