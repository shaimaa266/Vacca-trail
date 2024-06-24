import 'package:app_vacca/features/doctor%20view/features/treatment/data/repo/treatment_repo.dart';
import 'package:flutter/material.dart';
import '../../data/model/treatment_model.dart';

class TreatmentProvider extends ChangeNotifier {
  List<TreatmentModel> treatments = [];
  List<TreatmentModel> updateTreatments = [];
  List<TreatmentModel> addedTreatments = [];
  List<TreatmentModel> removedTreatments = [];

  final TreatmentRepo treatmentRepo;
  TreatmentProvider(this.treatmentRepo);
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 0;
  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }

  Future<void> fetchAllActivityPlaces() async {
    _setLoading(true);
    try {
      treatments = await treatmentRepo.getAllTreatments();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateTreatment(int id) async {
    _setLoading(true);
    try {
      updateTreatments = await treatmentRepo.editTreatment(id);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getAddTreatment(int id) async {
    _setLoading(true);
    try {
      addedTreatments = await treatmentRepo.addTreatment();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getRemoveTreatment(int id) async {
    _setLoading(true);
    try {
      removedTreatments = await treatmentRepo.deleteTreatment(id);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
