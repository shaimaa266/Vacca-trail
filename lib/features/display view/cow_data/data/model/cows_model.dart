class CowModel {
  final int id;
  final String cowId;
  final int activityplace_id;
  final int activitysystem_id;
  final int breadingsystem_id;
  final int purpose_id;
  final String original_area;
  final String appearance;
  final String image;
  final String gender;
  final String entrance_date;
  final int age;
  final String weight;
  final String milk_amount_morning;
  final String milk_amount_afternoon;
  final String latitude;
  final String longitude;
  final int cow_status;
  final String created_at;
  final String updated_at;


  CowModel({
    required this.id,
    required this.cowId,
    required this.activityplace_id,
    required this.activitysystem_id,
    required this.breadingsystem_id,
    required this.purpose_id,
    required this.original_area,
    required this.appearance,
    required this.image,
    required this.gender,
    required this.entrance_date,
    required this.age,
    required this.weight,
    required this.milk_amount_morning,
    required this.milk_amount_afternoon,
    required this.latitude,
    required this.longitude,
    required this.cow_status,

    required this.updated_at,
    required this.created_at,


  });

  factory CowModel.fromJson(Map<String, dynamic> json) {
    return CowModel(
        id: json['id'],
        cowId: json['cowId'],
        activityplace_id: json['activityplace_id'],
        activitysystem_id: json['activitysystem_id'],
        breadingsystem_id: json['breadingsystem_id'],
        purpose_id: json['purpose_id'],
        original_area: json['original_area'],
        appearance: json['appearance'],
        image: json['image'],
        gender: json['gender'],
        entrance_date: json['entrance_date'],
        age: json['age'],
        weight: json['weight'],
        milk_amount_morning: json['milk_amount_morning'],
        milk_amount_afternoon: json['milk_amount_afternoon'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        cow_status: json['cow_status'],
        created_at: json['created_at'],
        updated_at: json['updated_at'],

    );
  }
}
