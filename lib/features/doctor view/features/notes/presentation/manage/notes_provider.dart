import 'package:app_vacca/features/doctor%20view/features/notes/data/model/notes_model.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/data/repo/note_repo.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  bool isEmpty = false;
  List<NoteModel> allNotes = [];

  List<NoteModel> addedNotes = [];
  List<NoteModel> deletedNotes = [];
  List<NoteModel> editedNotes = [];
  List<NoteModel> staredNotes = [];
  List<NoteModel> unStaredNotes = [];
  final TextEditingController noteNameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final TextEditingController noteDescController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 0;
  final NoteRepo noteRepo;
  NotesProvider(this.noteRepo);
  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }

  Future<void> fetchAllNotes() async {
    _setLoading(true);
    try {
      allNotes = await noteRepo.getAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateNotes(
  {
   required int id,
  required  String noteId,
   required String title,
     required String body,
   required  int cowId,
   required  String? image,
   required  String createdAt,
  required   String updatedAt,
   required  List<dynamic>? cow,
}
  ) async {
    _setLoading(true);
    try {
      editedNotes = await noteRepo.editNote(
          id: id,
          title: title,
          noteId: noteId,
          cowId: cowId,
          image: image,
          createdAt: createdAt,
          updatedAt: updatedAt,
          body: body,
          cow: cow);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getAddNote(
    String noteId,
    int cowId,
    String? image,
    String title,
    String body,
  ) async {
    _setLoading(true);
    try {
      addedNotes = await noteRepo.addNote(
          body: body, image: image, cowId: cowId, noteId: noteId, title: title);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getRemoveNote(int id) async {
    _setLoading(true);
    try {
      deletedNotes = await noteRepo.deleteNote(id);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getStarNote(int id) async {
    _setLoading(true);
    try {
      staredNotes = await noteRepo.starNote(id);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getUnStarNote(int id) async {
    _setLoading(true);
    try {
      unStaredNotes = await noteRepo.unStarNote(id);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
