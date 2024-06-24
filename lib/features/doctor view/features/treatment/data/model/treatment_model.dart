

class TreatmentModel {
  final String title;
  final String description;
  TreatmentModel({required this.description, required this.title});
  factory TreatmentModel.fromJson(Map<String, dynamic> jsonData) {
    return TreatmentModel(description: jsonData[''], title: jsonData['']);
  }
}
