import 'dart:io';

import 'package:app_vacca/features/doctor%20view/features/notes/data/model/notes_model.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/data/repo/note_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class NotesProvider extends ChangeNotifier {
  bool isEmpty = false;
  List<NoteModel> allNotes = [];

  List <NoteModel>addedNotes = [];
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
  File? _selectedImage;
  String? get selectedImagePath => _selectedImage?.path;

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
//done
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
      allNotes = await noteRepo.editNote(
          id: id,
          title: title,
          noteId: noteId,
          cowId: cowId,
          image: image,
          createdAt: createdAt,
          updatedAt: updatedAt,
          body: body,
          cow: cow);
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
//not done
  Future<void> getAddNote({
    required String noteId,
    required int cowId,
    required String? image,
    required String title,
    required String body,
  }) async {
    _setLoading(true);
    try {
      allNotes = await noteRepo.addNote(
        noteId: noteId,
        cowId: cowId,
        image: image,
        title: title,
        body: body,
      );
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

//done
  Future<void> getRemoveNote(int id) async {
    _setLoading(true);
    try {
      deletedNotes = await noteRepo.deleteNote(id);
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
//done
  Future<void> getStarNote(int id) async {
    _setLoading(true);
    try {
      staredNotes =await noteRepo.starNote(id);
      allNotes = await noteRepo.starNote(id);
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
//done
  Future<void> getUnStarNote(int id) async {
    _setLoading(true);
    try {

      allNotes = await noteRepo.unStarNote(id);
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  //done
  Future<void> getAllStarred()async{
    _setLoading(true);
    try {
    staredNotes=await noteRepo.getAllStarredNotes();
      await fetchAllNotes();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  //done
  Future<void> openImagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
      notifyListeners();
    }
  }
}
