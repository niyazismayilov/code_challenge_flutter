class Randevu {
  int id;
  int masterId;
  String date;
  String startTime;
  String endTime;
  String customer;
  int accountId;
  List<int> serviceIds;

  Randevu({
    required this.id,
    required this.masterId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.customer,
    required this.accountId,
    required this.serviceIds,
  });

  factory Randevu.fromJson(Map<String, dynamic> json) => Randevu(
        id: json["id"],
        masterId: json["masterId"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        customer: json["customer"],
        accountId: json["accountId"],
        serviceIds: List<int>.from(json["serviceIds"].map((x) => x)),
      );
}
