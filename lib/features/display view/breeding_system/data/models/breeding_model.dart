import '../../../cow_data/data/model/cows_model.dart';
class BreedingModel {
  final int id;
  final String name;
  final String goal;
  final String cause_of_creation;
  final String description;
  final String created_at;
  final String updated_at;
  final int cows_count;
  final List<CowModel>? cows;

  BreedingModel({
    required this.id,
    required this.name,
    required this.goal,
    required this.cause_of_creation,
    required this.description,
    required this.created_at,
    required this.updated_at,
    required this.cows_count,
    required this.cows,
  });

  factory BreedingModel.fromJson(Map<String, dynamic> json) {
    var cowsList = json['cows'] as List;
    List<CowModel> cows = cowsList.map((i) => CowModel.fromJson(i)).toList();

    return BreedingModel(
      id: json['id'],
      name: json['name'],
      goal: json['goal'],
      cause_of_creation: json['cause_of_creation'],
      description: json['description'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      cows_count: json['cows_count'],
      cows: cows,
    );
  }
}

