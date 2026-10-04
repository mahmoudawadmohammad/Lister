// To parse this JSON data, do
//
//     final customer = customerFromMap(jsonString);

import 'dart:convert';

class Customer {
  Customer({
    this.id = 0,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.address,
    this.phone,
    this.email,
    this.password,
    this.image,
    this.status,
    this.cityId,
  });

  int id;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? address;
  String? phone;
  String? email;
  String? password;
  String? image;
  String? status;
  int? cityId;

  factory Customer.fromJson(String str) => Customer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    id: json["Id"],
    firstName: json["First_Name"],
    lastName: json["Last_Name"],
    birthDate: json["Birth_Date"],
    address: json["Address"],
    phone: json["Phone"],
    email: json["Email"],
    password: json["Password"],
    image: json["Image"],
    status: json["Status"],
    cityId: json["City_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "First_Name": firstName,
    "Last_Name": lastName,
    "Birth_Date": birthDate,
    "Address": address,
    "Phone": phone,
    "Email": email,
    "Password": password,
    "Image": image,
    "Status": status,
    "City_ID": cityId,
  };
}
