import 'dart:convert';

Lecturer lecturerFromJson(String str) => Lecturer.fromJson(json.decode(str));

String lecturerToJson(Lecturer data) => json.encode(data.toJson());

class Lecturer {
  final String id;
  final String nik;
  final String name;
  final String nip;
  final String nidn;
  final String karpeg;
  final String npwp;
  final String gender;
  final DateTime birthday;
  final String birthplace;
  final String phone;
  final String address;
  final String departmentId;
  final String photo;
  final int maritalStatus;
  final int religion;
  final int associationType;
  final int status;

  Lecturer({
    required this.id,
    required this.nik,
    required this.name,
    required this.nip,
    required this.nidn,
    required this.karpeg,
    required this.npwp,
    required this.gender,
    required this.birthday,
    required this.birthplace,
    required this.phone,
    required this.address,
    required this.departmentId,
    required this.photo,
    required this.maritalStatus,
    required this.religion,
    required this.associationType,
    required this.status,
  });

  factory Lecturer.fromJson(Map<String, dynamic> json) => Lecturer(
        id: json["id"],
        nik: json["nik"],
        name: json["name"],
        nip: json["nip"],
        nidn: json["nidn"],
        karpeg: json["karpeg"],
        npwp: json["npwp"],
        gender: json["gender"],
        birthday: DateTime.parse(json["birthday"]),
        birthplace: json["birthplace"],
        phone: json["phone"],
        address: json["address"],
        departmentId: json["department_id"],
        photo: json["photo"],
        maritalStatus: json["marital_status"],
        religion: json["religion"],
        associationType: json["association_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "name": name,
        "nip": nip,
        "nidn": nidn,
        "karpeg": karpeg,
        "npwp": npwp,
        "gender": gender,
        "birthday": birthday.toIso8601String(),
        "birthplace": birthplace,
        "phone": phone,
        "address": address,
        "department_id": departmentId,
        "photo": photo,
        "marital_status": maritalStatus,
        "religion": religion,
        "association_type": associationType,
        "status": status,
      };
}
