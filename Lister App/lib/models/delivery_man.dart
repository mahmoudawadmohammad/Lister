// To parse this JSON data, do
//
//     final deliveryMan = deliveryManFromMap(jsonString);

import 'dart:convert';

class DeliveryManModel {
  DeliveryManModel({
    this.id = 0,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.phone,
    this.email,
    this.password,
    this.address,
    this.image,
    this.hireDate,
    this.endDate,
    this.status,
    this.cityId,
  });

  int id;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? phone;
  String? email;
  String? password;
  String? address;
  String? image;
  String? hireDate;
  String? endDate;
  String? status;
  int? cityId;

  factory DeliveryManModel.fromJson(String str) => DeliveryManModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeliveryManModel.fromMap(Map<String, dynamic> json) => DeliveryManModel(
    id: json["Id"],
    firstName: json["First_Name"],
    lastName: json["Last_Name"],
    birthDate: json["Birth_Date"],
    phone: json["Phone"],
    email: json["Email"],
    password: json["Password"],
    address: json["Address"],
    image: json["Image"],
    hireDate: json["Hire_Date"],
    endDate: json["End_Date"],
    status: json["Status"],
    cityId: json["City_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "First_Name": firstName,
    "Last_Name": lastName,
    "Birth_Date": birthDate,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Address": address,
    "Image": image,
    "Hire_Date": hireDate,
    "End_Date": endDate,
    "Status": status,
    "City_ID": cityId,
  };
}
