// ignore_for_file: public_member_api_docs, sort_constructors_first

class ContactModel {
  int? id;
  String? name;
  String? phone;

  ContactModel({
    this.id,
    this.name,
    this.phone,
  });

  ContactModel copyWith({
    int? id,
    String? name,
    String? phone,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }
}
