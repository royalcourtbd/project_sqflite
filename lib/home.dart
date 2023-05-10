import 'package:flutter/material.dart';
import 'package:project_sqflite/database_helper.dart';
import 'package:project_sqflite/employee_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EmployeeModel> _users = [];

  final employ = EmployeeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'sqf lite',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: () async {
            //     await DbHelper.instance.insert({dbColumnName: "sayed"}); var dbQuery = await DbHelper.instance.queryDatabase();
            //     setState(() {
            //       _users = dbQuery;
            //     });
            //   },
            //   child: const Text('Create'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     var dbQuery = await DbHelper.instance.queryDatabase();
            //     setState(() {
            //       _users = dbQuery;
            //     });
            //   },
            //   child: const Text('Read'),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await DbHelper.instance
            //         .updateDatabase({dbColumnId: 7, dbColumnName: 'Toshiba'}); var dbQuery = await DbHelper.instance.queryDatabase();
            //     setState(() {
            //       _users = dbQuery;
            //     });
            //   },
            //   child: const Text('Update'),
            // ),
            ElevatedButton(
              onPressed: () async {
                employ.name = 'Sayed';
                employ.age = '25';
                employ.designation = 'Flutter intern';

                DatabaseHelper.insertData(databaseTableName, employ.toJson())
                    .then((value) {
                  if (value > 0) {
                    print(value);
                  }
                }).catchError((error) => print(error));

                var dbQuery = await DatabaseHelper.getAllEmployee();

                // await DbHelper.instance.deleteDatabase(12);
                // var dbQuery = await DbHelper.instance.queryDatabase();
                setState(() {
                  _users = dbQuery;
                });
              },
              child: const Text('insert'),
            ),
            ListView.builder(
              itemCount: _users.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(
                    '${_users[index].id}  ${_users[index].designation!}');
              },
            )
          ],
        ),
      ),
    );
  }
}
