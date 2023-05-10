const String databaseName = 'employeeDatabase.db';
const int databaseVersion = 1;
const String databaseTableName = 'employeeTable';
const String databaseEmployeeTableColumnId = 'id';
const String databaseEmployeeTableColumnName = 'name';
const String databaseEmployeeTableColumnDesignation = 'designation';
const String databaseEmployeeTableColumnAge = 'age';

class EmployeeModel {
  int? id;
  String? name;
  String? age;
  String? designation;

  EmployeeModel({
    this.id,
    this.name,
    this.age,
    this.designation,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json[databaseEmployeeTableColumnId],
        name: json[databaseEmployeeTableColumnName],
        age: json[databaseEmployeeTableColumnAge],
        designation: json[databaseEmployeeTableColumnDesignation],
      );

  Map<String, dynamic> toJson() => {
        databaseEmployeeTableColumnId: id,
        databaseEmployeeTableColumnName: name,
        databaseEmployeeTableColumnAge: age,
        databaseEmployeeTableColumnDesignation: designation,
      };
}
