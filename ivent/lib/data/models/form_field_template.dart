class FormFieldTemplate {
  final int id;
  final String name;
  final String fieldType;
  final dynamic defaultValue;
  final bool required;
  final int eventId;

  FormFieldTemplate({
    required this.id,
    required this.name,
    required this.fieldType,
    required this.defaultValue,
    required this.required,
    required this.eventId,
  });

  factory FormFieldTemplate.fromJson(Map<String, dynamic> json) {
    return FormFieldTemplate(
      id: json['id'],
      name: json['name'],
      fieldType: json['field_type'],
      defaultValue: json['default_value'],
      required: json['required'],
      eventId: json['event_id'],
    );
  }
}
