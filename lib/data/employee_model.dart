// ignore_for_file: public_member_api_docs, sort_constructors_first

const String databaseName = 'employeeDatabase.db';
const int databaseVersion = 1;
const String databaseTableName = 'employeeTable';
const String databaseEmployeeTableColumnId = 'id';
const String databaseEmployeeTableColumnName = 'name';
const String databaseEmployeeTableColumnDesignation = 'designation';

class EmployeeModel {
  int? id;
  String? name;
  String? designation;

  EmployeeModel({
    this.id,
    this.name,
    this.designation,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json[databaseEmployeeTableColumnId],
        name: json[databaseEmployeeTableColumnName],
        designation: json[databaseEmployeeTableColumnDesignation],
      );

  Map<String, dynamic> toJson() => {
        databaseEmployeeTableColumnId: id,
        databaseEmployeeTableColumnName: name,
        databaseEmployeeTableColumnDesignation: designation,
      };

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? designation,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      designation: designation ?? this.designation,
    );
  }
}
