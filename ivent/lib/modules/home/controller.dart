import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:ivent/data/models/category.model.dart' as cat;
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/providers/category.provider.dart';
import 'package:ivent/data/providers/event.provider.dart';
import 'package:ivent/data/repository/category.repository.dart';
import 'package:ivent/data/repository/event.repository.dart';
import 'package:ivent/themes/app_theme.dart';

class HomeController extends GetxController {
  final EventRepository eventRepository = EventRepository(EventProvider());
  final CategoryRepository categoryRepository =
      CategoryRepository(CategoryProvider());
  RxBool loadingEvents = false.obs;
  RxBool loadingCurrentEvent = false.obs;

  RxBool loadingCategories = false.obs;
  RxInt selectedCategory = (-1).obs;
  RxList<Event> events = <Event>[].obs;
  Event currentEvent = Event();
  RxList<Event> filtredEvents = <Event>[].obs;
  RxList<cat.Category> categories = <cat.Category>[].obs;

  var currentLocation = 'Casablanca'.obs;

  @override
  void onInit() async {
    super.onInit();
    fetchEvents();
    fetchCategories();
  }

  void fetchEvents() async {
    try {
      loadingEvents.value = true;
      final fetchedEvents = await eventRepository.list();
      events.assignAll(fetchedEvents);
      loadingEvents.value = false;
    } catch (e) {
      loadingEvents.value = false;

      print("Error fetching events: $e");
    }
  }

  void fetchingCurrentEvent() async {
    try {
      loadingCurrentEvent.value = true;

      var _ = await eventRepository.myEvents();
      currentEvent = _.first;
      loadingCurrentEvent.value = false;
    } catch (e) {
      loadingCurrentEvent.value = false;
    }
  }

  void fetchCategories() async {
    try {
      loadingCategories.value = true;
      final cat = await categoryRepository.getCategories();
      categories.assignAll(cat);
      loadingCategories.value = false;
    } catch (e) {
      print("Error fetching events: $e");
      loadingCategories.value = false;
    }
  }

  void fetchEventsByCategory(catId) async {
    try {
      loadingEvents.value = true;
      final fetchedEvents = await eventRepository.eventsByCategory(catId);
      filtredEvents.assignAll(fetchedEvents);
      loadingEvents.value = false;
    } catch (e) {
      loadingEvents.value = false;

      print("Error fetching events: $e");
    }
  }

  void changeLocation(String newLocation) {
    currentLocation.value = newLocation;
  }

  void openDrawer() {
    // Logic to open the drawer
  }

  void handleNotifications() {
    // Logic to handle notifications
  }

  void searchEvents(String query) {
    // Logic to search events based on the query
  }

  void filterEvents() {
    // Logic to filter events
  }

  void joinEvent() {
    // Logic to handle joining an event
  }
  String dateFormatter(String dt) {
    DateTime dateTime = DateTime.parse(dt);
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  Color getRandomColor() {
    Random random = Random();
    return AppColors.themeColors[random.nextInt(AppColors.themeColors.length)];
  }
}
