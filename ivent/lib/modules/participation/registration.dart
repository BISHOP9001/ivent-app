import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:ivent/global/widgets/buttons/main_button.dart';
import 'package:ivent/modules/participation/controller.dart';

class RegistrationFormPage extends StatelessWidget {
  final ParticipationController controller = Get.put(ParticipationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration'),
      ),
      body: Obx(() {
        if (controller.formFields.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...controller.formFields.map((field) {
                switch (field.fieldType) {
                  case 'text':
                    return buildTextField(field);
                  case 'email':
                    return buildEmailField(field);
                  case 'select':
                    return buildSelectField(field);
                  default:
                    return Container();
                }
              }).toList(),
              SizedBox(height: 20),
              GMainButton(
                text: 'Submit',
                onPressed: () {
                  controller.submitForm();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildTextField(field) {
    String? initialValue;

    switch (field.name.toLowerCase()) {
      case 'full name':
      case 'name':
        initialValue = controller.user.value.name;
        controller.updateFormData(field.id, controller.user.value.name);

        break;
      case 'phone':
        initialValue = controller.user.value.phone;
        controller.updateFormData(field.id, controller.user.value.phone);

        break;
      // Add more cases as needed for other user fields
    }

    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: field.name,
      ),
      onChanged: (value) {
        controller.updateFormData(field.id, value);
      },
    );
  }

  Widget buildEmailField(field) {
    controller.updateFormData(
      field.id,
      controller.user.value.email,
    );

    return TextFormField(
      initialValue: controller.user.value.email,
      decoration: InputDecoration(
        labelText: field.name,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        controller.updateFormData(field.id, value);
      },
    );
  }

  Widget buildSelectField(field) {
    List<String> options;
    try {
      options = List<String>.from(jsonDecode(field.defaultValue));
    } catch (e) {
      options = [];
      print('Error decoding defaultValue: ${field.defaultValue}');
    }

    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: field.name,
      ),
      value: controller.formData[field.name],
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        controller.updateFormData(field.id, value);
      },
    );
  }
}
