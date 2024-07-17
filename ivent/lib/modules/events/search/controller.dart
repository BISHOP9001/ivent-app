import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/providers/event.provider.dart';
import 'package:ivent/data/repository/event.repository.dart';

class EventSearchController extends GetxController
    with GetTickerProviderStateMixin {
  final EventRepository eventRepository = EventRepository(EventProvider());

  var events = <Event>[].obs;
  var searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() async {
    try {
      final eventList = await eventRepository.list();
      events.assignAll(eventList);
    } catch (e) {
      print("Error fetching events: $e");
    }
  }

  void searchEvents(String query) {
    // Implement search functionality here
  }
}
