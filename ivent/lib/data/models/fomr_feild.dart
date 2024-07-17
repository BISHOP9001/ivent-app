class FormField {
  String id;
  String label;
  String type;
  String value;

  FormField(
      {required this.id,
      required this.label,
      required this.type,
      this.value = ''});

  factory FormField.fromJson(Map<String, dynamic> json) {
    return FormField(
      id: json['id'],
      label: json['label'],
      type: json['type'],
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'type': type,
      'value': value,
    };
  }
}
