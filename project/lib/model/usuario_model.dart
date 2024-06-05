import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String email;
  String fullName;
  String telefone;
  String matricula;
  String permission;
  DateTime dateOfBirth;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.permission,
    required this.dateOfBirth,
    required this.telefone,
    required this.matricula,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      permission: map['permission'] ?? 'user',
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      telefone: map['telefone'] ?? '',
      matricula: map['matricula'] ?? '',
      id: '',
    );
  }
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      email: doc['email'] ?? '',
      fullName: doc['fullName'] ?? '',
      permission: doc['permission'] ?? 'user',
      dateOfBirth: (doc['dateOfBirth'] as Timestamp).toDate(),
      telefone: doc['telefone'] ?? '',
      matricula: doc['matricula'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'permission': permission,
      'dateOfBirth': dateOfBirth,
      'matricula': matricula,
      'telefone': telefone,
    };
  }
}
