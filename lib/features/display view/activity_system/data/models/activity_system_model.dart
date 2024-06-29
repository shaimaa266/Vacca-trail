import '../../../cow_data/data/model/cows_model.dart';

class ActivitySystemModel {
  final int id;
  final String name;
  final String goal;
  final String ?activities;
  final String sleepTime;
  final String wakeUpTime;
  final int ?breedingId;
  final String cause_of_creation;
  final String description;
  final String created_at;
  final String updated_at;
  final int cows_count;
  final List<CowModel>? cows;

  ActivitySystemModel({
    required this.id,
    required this.wakeUpTime,
    required this.sleepTime,required this.breedingId,
    required this.activities,
    required this.name,
    required this.goal,
    required this.cause_of_creation,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.cows_count,
    required this.cows,
  });

  factory ActivitySystemModel.fromJson(Map<String, dynamic> json) {
    var cowsList = json['cows'] as List;
    List<CowModel>? cows = cowsList.map((i) => CowModel.fromJson(i)).toList();

    return ActivitySystemModel(
      id: json['id'],
      name: json['name'],
      goal: json['goal'],
      cause_of_creation: json['cause_of_creation'],
      description: json['description'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      cows_count: json['cows_count'],
      cows: cows,
      activities: json['activities'],
      breedingId: json['breadingsystem_id'],
      sleepTime: json['sleep_time'],
      wakeUpTime: json['wakeup_time'],
    );
  }
}

