import 'package:ivent/data/models/api_exception.model.dart';
import 'package:ivent/data/models/form_field_template.dart';
import 'package:ivent/data/providers/app_get_connect.dart';

class FormFieldTemplateProvider extends AppGetConnect {
  Future<List<FormFieldTemplate>> getFormFields(int eventId) async {
    final response = await get('event-forms/$eventId');
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error fetching form fields',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    } else {
      final d = response.body as List;
      return d.map((e) => FormFieldTemplate.fromJson(e)).toList();
    }
  }

  Future<void> fillForm(Map<String, dynamic> formData) async {
    final response = await post('event-forms/fill', formData);
    if (response.status.hasError) {
      throw ApiException(
        message: 'Error submitting form',
        statusCode: response.statusCode,
        errors: response.body.containsKey('errors')
            ? response.body['errors']
            : null,
      );
    }
  }
}
