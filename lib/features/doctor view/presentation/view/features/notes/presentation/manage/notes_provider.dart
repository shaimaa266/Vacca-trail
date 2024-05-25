
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  bool isEmpty = false;
  List<String>todayNotes=[];
  List<String>yesterdayNotes=[];
  final TextEditingController noteNameController = TextEditingController();

  final TextEditingController noteDescController = TextEditingController();

}
