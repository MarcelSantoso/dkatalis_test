import 'dart:convert';

import 'package:intl/intl.dart';

class Data {
  String? email;
  String? password;
  String? goalActivation;
  String? goalIncome;
  String? goalExpense;
  DateTime? scheduleDate;
  DateTime? scheduleTime;

  String parseAsJson() {
    DateFormat formatDate = DateFormat("yyyy-MM-dd");
    DateFormat formatTime = DateFormat("HH:mm");
    Map<String, String> map = {
      "email": email ?? "",
      "password": password ?? "",
      "goal": goalActivation ?? "",
      "income": goalIncome ?? "",
      "expense": goalExpense ?? "",
      "date": scheduleDate != null ? formatDate.format(scheduleDate!) : "",
      "time": scheduleTime != null ? formatTime.format(scheduleTime!) : "",
    };

    return json.encode(map);
  }
}
