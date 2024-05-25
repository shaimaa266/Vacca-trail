import '../../../cow_data/data/model/cows_model.dart';

class ActivityPlacesModel {
  final int id;
  final String image;
  final int activitySystemId;
  final String goal;
  final String description;
  final int capacity;
  final String type;
  final String latitude;
  final String longitude;
  final String createdAt;
  final String updatedAt;
  final int cowCount;
  final List<CowModel> cows;

  ActivityPlacesModel(
      {required this.id,
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
      required this.longitude, });

  factory ActivityPlacesModel.fromJson(Map<String, dynamic> jsonData) {
    var cowsList = jsonData['cows'] as List;
    List<CowModel> cows = cowsList.map((i) => CowModel.fromJson(i)).toList();
    return ActivityPlacesModel(
      id: jsonData['id'],
      image: jsonData['image'],
      activitySystemId: jsonData['activitysystem_id'],
      goal: jsonData['goal'],
      updatedAt: jsonData['updated_at'],
      createdAt: jsonData['created_at'],
      type: jsonData['type'],
      description: jsonData['description'],
      capacity: jsonData['capacity'],
      cowCount: jsonData['cows_count'],
      cows: cows,
      latitude: jsonData['latitude'],
      longitude: jsonData['longitude'],
    );
  }
}
