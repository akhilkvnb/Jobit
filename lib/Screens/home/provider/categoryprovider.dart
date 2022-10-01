import 'package:flutter/cupertino.dart';
import 'package:jobit/services/api_category.dart';

import '../model/category.dart';

class CategoryProvider with ChangeNotifier {
  // List? statesList;
  // String? myState;

  Future<List<CategoryModel>?> getListCategory() async {
    final response = await ApiCategory().getCategory();
    if (response != null) {
      //statesList = response;
      return response;
    }
    return null;
  }
}
