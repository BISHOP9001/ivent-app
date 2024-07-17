class FormFieldTemplateValue {
  int id;
  int formFieldTemplateId;
  String value;

  FormFieldTemplateValue({
    required this.id,
    required this.formFieldTemplateId,
    required this.value,
  });

  factory FormFieldTemplateValue.fromJson(Map<String, dynamic> json) {
    return FormFieldTemplateValue(
      id: json['id'],
      formFieldTemplateId: json['form_field_template_id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'form_field_template_id': formFieldTemplateId,
      'value': value,
    };
  }
}
