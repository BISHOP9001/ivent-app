import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/models/review.dart';
import 'package:ivent/data/providers/event.provider.dart';
import 'package:ivent/data/providers/participation.provider.dart';
import 'package:ivent/data/providers/review.provider.dart';
import 'package:ivent/data/repository/event.repository.dart';
import 'package:ivent/data/repository/participation.repository.dart';
import 'package:ivent/data/repository/review.repository.dart';
import 'package:ivent/modules/review/controller.dart';

class EventController extends GetxController {
  final EventRepository eventRepository = EventRepository(EventProvider());
  int eventId = 0;
  var event = Event().obs;
  RxBool isLoading = false.obs;

  final ReviewRepository reviewRepository = ReviewRepository(ReviewProvider());
  var reviews = <Review>[].obs;

  @override
  void onInit() async {
    super.onInit();
    if (eventId == 0) eventId = Get.arguments;
    Get.put<ReviewController>(ReviewController());

    await fetchEventDetails();
    fetchReviews(eventId);
    checkParticipation();
  }

  Future<void> fetchEventDetails() async {
    try {
      isLoading.value = true;
      final eventDetails = await eventRepository.show(eventId);
      event.value = eventDetails;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print("Error fetching event details: $e");
    }
  }

  Future<void> fetchReviews(int eventId) async {
    try {
      isLoading.value = true;
      var fetchedReviews = await reviewRepository.list(eventId);
      reviews.assignAll(fetchedReviews);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print("Error fetching reviews: $e");
    }
  }

  RxBool isParticipate = false.obs;
  Future<void> checkParticipation() async {
    try {
      isLoading.value = true;
      isParticipate.value =
          await ParticipationRepository(ParticipationProvider())
              .checkParticipation(eventId);

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void joinEvent() {
    // Logic to handle joining an event
  }
  String formatDateTimeRange(DateTime startDate, DateTime endDate) {
    final dateFormatter = DateFormat('d MMMM, yyyy');
    final dayFormatter = DateFormat('EEEE');
    final timeFormatter = DateFormat('h:mm a');

    String formattedDate = dateFormatter.format(startDate);
    String formattedDay = dayFormatter.format(startDate);
    String formattedStartTime = timeFormatter.format(startDate);
    String formattedEndTime = timeFormatter.format(endDate);

    return '$formattedDate\n$formattedDay, $formattedStartTime - $formattedEndTime';
  }
}
