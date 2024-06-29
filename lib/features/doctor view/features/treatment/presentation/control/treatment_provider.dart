import 'package:app_vacca/features/doctor%20view/features/treatment/data/repo/treatment_repo.dart';
import 'package:flutter/material.dart';
import '../../data/model/treatment_model.dart';

class TreatmentProvider extends ChangeNotifier {
  List<TreatmentModel> allTreatments = [];
  List<TreatmentModel> updateTreatments = [];
  List<TreatmentModel> addedTreatments = [];
  List<TreatmentModel> removedTreatments = [];
  final TextEditingController noteNameController = TextEditingController();

  final TextEditingController diseasesController = TextEditingController();

  final TextEditingController medicineUsedController = TextEditingController();

  final TextEditingController dosageController = TextEditingController();

  final TextEditingController infoController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController  dateController = TextEditingController();
  final TextEditingController  timeController = TextEditingController();

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

  Future<void> fetchAllTreatments(int cowId) async {
    _setLoading(true);
    try {
      allTreatments = await treatmentRepo.getAllTreatments(cowId);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateTreatment({
    required int cowId ,required String disease,required String name,required String diagnose,required int doses,required String searchTerm
}) async {
    _setLoading(true);
    try {
      allTreatments = await treatmentRepo.editTreatment(cowId: cowId,diagnose:diagnose , name: name,disease: disease,doses: doses,searchTerm: searchTerm);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getAddTreatment({required int cowId ,required String disease,required String name,required String diagnose,required int doses,required String searchTerm}) async {
    _setLoading(true);
    try {
      allTreatments = await treatmentRepo.addTreatment(searchTerm: searchTerm,doses: doses,disease: disease,diagnose: diagnose,cowId: cowId,name: name);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getRemoveTreatment({required int cowId}) async {
    _setLoading(true);
    try {
      allTreatments = await treatmentRepo.deleteTreatment(cowId);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
