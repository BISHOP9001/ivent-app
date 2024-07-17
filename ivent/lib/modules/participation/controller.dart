import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/event.model.dart';
import 'package:ivent/data/models/form_field_template.dart';
import 'package:ivent/data/models/participation.dart';
import 'package:ivent/data/models/user.model.dart';
import 'package:ivent/data/providers/event.provider.dart';
import 'package:ivent/data/providers/form_feild_template.provider.dart';
import 'package:ivent/data/providers/participation.provider.dart';
import 'package:ivent/data/repository/event.repository.dart';
import 'package:ivent/data/repository/form_field_template.repository.dart';
import 'package:ivent/data/repository/participation.repository.dart';
import 'package:ivent/global/helper/utils.dart';
import 'package:ivent/global/store/app_store.dart';
import 'package:ivent/modules/participation/badge.dart';
import 'package:ivent/modules/participation/thankyou.dart';

class ParticipationController extends GetxController {
  var formFields = <FormFieldTemplate>[].obs;
  var isLoading = true.obs;
  var user = User().obs;
  int eventId = 0;
  final EventRepository eventRepository = EventRepository(EventProvider());
  final FormFieldTemplateRepository formFieldTemplateRepository =
      FormFieldTemplateRepository(FormFieldTemplateProvider());
  var event = Event().obs;
  var formData = {}.obs;
  Participation participation = Participation();
  @override
  void onInit() {
    super.onInit();
    if (eventId == 0) eventId = Get.arguments;
    fetchUserData();
    fetchEventDetails();
    fetchFormFields();
  }

  void fetchUserData() {
    user.value = AppStore.authStore.currentUser.value!
        .user!; // Assuming this is how you get the current user
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

  Future<void> fetchFormFields() async {
    try {
      isLoading.value = true;
      var fields = await formFieldTemplateRepository.getFormFields(eventId);
      formFields.assignAll(fields);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void updateFormData(int fieldId, dynamic value) {
    formData[fieldId] = value;
  }

  void submitForm() async {
    try {
      var formDataMap = formData.entries.map((entry) {
        return {
          'field_id': entry.key, // Ensure key is the field ID
          'value': entry.value,
        };
      }).toList();

      var payload = {
        'form_fields': formDataMap,
      };
      var data = {
        "event_id": eventId,
        "status": "registred",
        "activities": "*"
      };
      participation =
          await ParticipationRepository(ParticipationProvider()).create(data);
      var _ = await formFieldTemplateRepository.fillForm(payload);

      Get.to(() => ThankYouPage());
    } on Exception catch (e) {
      if (e is ApiException) showErrorSnackBar("", e.message);
    }
  }

  void generateBadge() async {
    // Generate badge/ticket
    Get.to(() => BadgePage());
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
