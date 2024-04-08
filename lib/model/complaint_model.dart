class ComplaintModel {
  int? complaintId;
  String description;
  DateTime date;
  String region;
  int streetNum;
  String typeOfAnimal;
  String address;

  ComplaintModel({
    this.complaintId,
    required this.description,
    required this.date,
    required this.region,
    required this.streetNum,
    required this.typeOfAnimal,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'complaints_id': complaintId,
      'Description_the_problem': description,
      'date': date.toIso8601String(),
      'region': region,
      'Street_num': streetNum,
      'type_of_animal': typeOfAnimal,
      'Address': address,
    };
  }

  static ComplaintModel fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      complaintId: map['complaints_id'],
      description: map['Description_the_problem'],
      date: DateTime.parse(map['date']),
      region: map['region'],
      streetNum: map['Street_num'],
      typeOfAnimal: map['type_of_animal'],
      address: map['Address'],
    );
  }
}
