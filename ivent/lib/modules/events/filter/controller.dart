import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedCategories = <String>[].obs;
  var selectedTime = ''.obs;
  var selectedLocation = 'New York, USA'.obs;

  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }

  void setLocation(String location) {
    selectedLocation.value = location;
  }

  void resetFilters() {
    selectedCategories.clear();
    selectedTime.value = '';
    selectedLocation.value = 'New York, USA';
  }

  void applyFilters() {
    // Implement filter application logic
    print('Filters applied');
  }
}
