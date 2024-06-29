class TreatmentModel {
  final String ?name;
  final int ?id;
  final int? cowId;
  final String? disease;
  final String?doses;
  final String ?diagnose;
  final int ?treatmentStockId;
  final List ?treatmentDoseTimes;
  final String ?createdAt;
  final String ?updatedAt;
  TreatmentModel(
      {required this.cowId,
      required this.disease,
      required this.name,
      required this.diagnose,
      required this.doses,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.treatmentDoseTimes,
      required this.treatmentStockId});
  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
        cowId: json['cow_id']??0,
        disease: json['disease']??'',
        name: json['name']??'',
        diagnose: json['diagnose']??'',
        doses: json[' doses']??'',
        id: json['id']??'',
        createdAt: json['created_at']??'',
        updatedAt: json['updated_at']??'',
        treatmentDoseTimes: json['treatment_dose_times'] ?? [],
        treatmentStockId: json['treatmentstock_id']??0);
  }
}
