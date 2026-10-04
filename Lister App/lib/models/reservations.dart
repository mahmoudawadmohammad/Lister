// To parse this JSON data, do
//
//     final reservation = reservationFromMap(jsonString);

import 'dart:convert';

List<Reservation> reservationFromJson(String str) => List<Reservation>.from(json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationToJson(List<Reservation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
  Reservation({
    this.id = 0,
    required this.dateTime,
    required this.edateTime,
    required this.personesNumber,
    required this.tablesNumber,
    required this.status,
    required this.comments,
    required this.customerId,
    required this.restaurantId,
  });

  final int id;
  final String dateTime;
  final String edateTime;
  final int personesNumber;
  final String tablesNumber;
  final String status;
  final String comments;
  final int customerId;
  final int restaurantId;

  factory Reservation.fromJson(String str) => Reservation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
    id: json["Id"],
    dateTime: json["Date_Time"],
    edateTime: json["Edate_Time"],
    personesNumber: json["Persones_Number"],
    tablesNumber: json["Tables_Number"],
    status: json["Status"],
    comments: json["Comments"],
    customerId: json["Customer_ID"],
    restaurantId: json["Restaurant_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Date_Time": dateTime,
    "Edate_Time": edateTime,
    "Persones_Number": personesNumber,
    "Tables_Number": tablesNumber,
    "Status": status,
    "Comments": comments,
    "Customer_ID": customerId,
    "Restaurant_ID": restaurantId,
  };
}
