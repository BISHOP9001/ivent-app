import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/providers/event.provider.dart';
import 'package:ivent/data/repository/event.repository.dart';

class MyEventsController extends GetxController {
  final EventRepository eventRepository = EventRepository(EventProvider());

  var events = <Event>[].obs;
  RxBool isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEvents();
  }

  void fetchEvents() async {
    try {
      isloading.value = true;

      final eventList = await eventRepository.myEvents();
      events.assignAll(eventList);
      isloading.value = false;
    } catch (e) {
      isloading.value = false;

      print("Error fetching events: $e");
    }
  }

  String formatDateTimeRange(DateTime startDate, DateTime endDate) {
    final dateFormatter = DateFormat('d MMMM, yyyy');
    final dayFormatter = DateFormat('EEEE');
    final timeFormatter = DateFormat('h:mm a');

    String formattedDate = dateFormatter.format(startDate);
    String formattedDay = dayFormatter.format(startDate);

    return '$formattedDate $formattedDay';
  }
}
