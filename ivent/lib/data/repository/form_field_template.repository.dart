import 'package:ivent/data/models/form_field_template.dart';
import 'package:ivent/data/providers/form_feild_template.provider.dart';

class FormFieldTemplateRepository {
  final FormFieldTemplateProvider apiClient;

  FormFieldTemplateRepository(this.apiClient);

  Future<List<FormFieldTemplate>> getFormFields(int eventId) async {
    try {
      return await apiClient.getFormFields(eventId);
    } catch (e) {
      throw e;
    }
  }

  Future<void> fillForm(Map<String, dynamic> formData) async {
    try {
      return await apiClient.fillForm(formData);
    } catch (e) {
      throw e;
    }
  }
}
