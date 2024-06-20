import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';

import '../../../activity_system/data/models/activity_system_model.dart';
import '../../../breeding_system/data/models/breeding_model.dart';
class CowModel {
  final int? id;
  final String? cowId;
  final int? activityplace_id;
  final int? activitysystem_id;
  final int? breadingsystem_id;
  final int? purpose_id;
  final String? original_area;
  final String? appearance;
  final String? image;
  final String? gender;
  final String? entrance_date;
  final int? age;
  final int? isPregnant;
  final String? weight;
  final String? milk_amount_morning;
  final String? milk_amount_afternoon;
  final String? latitude;
  final String? longitude;
  final int? cow_status;
  final String? created_at;
  final String? updated_at;
  final List<BreedingModel>? breeding_system;
  final List<ActivitySystemModel>? activity_system;
  final List<ActivityPlacesModel>? activity_places;

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
    this.breeding_system,
    this.activity_system,
    this.activity_places,
    required this.isPregnant,
  });

  factory CowModel.fromJson(Map<String, dynamic> json) {
    var breedingList = json['breedingSystems'] as List?;
    List<BreedingModel>? breedings = breedingList != null
        ? breedingList.map((i) => BreedingModel.fromJson(i)).toList()
        : null;

    var systemsList = json['activitySystems'] as List?;
    List<ActivitySystemModel>? systems = systemsList != null
        ? systemsList.map((i) => ActivitySystemModel.fromJson(i)).toList()
        : null;

    var placeList = json['activityPlaces'] as List?;
    List<ActivityPlacesModel>? places = placeList != null
        ? placeList.map((i) => ActivityPlacesModel.fromJson(i)).toList()
        : null;

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
      breeding_system: breedings,
      activity_system: systems,
      activity_places: places,
      isPregnant: json['is_pregnant'],
    );
  }
}

