import '../../../cow_data/data/model/cows_model.dart';
class ActivityPlacesModel {
  final int id;
  final String ?name;
  final String image;
  final int activitySystemId;
  final String goal;
  final String description;
  final int capacity;
  final String type;
  final String
  ?latitude;
  final String? longitude;
  final String? createdAt;
  final String ?updatedAt;
  final int cowCount;
  final List<CowModel> ?cows;

  ActivityPlacesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.activitySystemId,
    required this.goal,
    required this.updatedAt,
    required this.createdAt,
    required this.type,
    required this.description,
    required this.capacity,
    required this.cowCount,
    required this.cows,
    required this.latitude,
    required this.longitude,
  });

  factory ActivityPlacesModel.fromJson(Map<String, dynamic> jsonData) {
    var cowsList = jsonData['cows'] as List? ?? [];
    List<CowModel>? cows = cowsList.map((i) => CowModel.fromJson(i)).toList();
    return ActivityPlacesModel(
      id: jsonData['id'] ?? 0,
      name:  jsonData['name'],
      image: jsonData['image'] as String??'',
      activitySystemId: jsonData['activitysystem_id'] ?? 0,
      goal: jsonData['goal'] ?? '',
      updatedAt: jsonData['updated_at'] ?? '',
      createdAt: jsonData['created_at'] ?? '',
      type: jsonData['type'] ?? '',
      description: jsonData['description'] ?? '',
      capacity: jsonData['capacity'] ?? 0,
      cowCount: jsonData['cows_count'] ?? 0,
      cows: cows,
      latitude: jsonData['latitude'] as String??'',
      longitude: jsonData['longitude'] as String??'',
    );
  }
}


