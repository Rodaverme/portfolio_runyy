import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer';

Future sendEmail({
  required String name,
  required String email,
  required String subject,
  required String message,
}) async {
  final serviceID = 'service_dm3dbnf'; // Replace with your service ID
  final templateID = 'template_mr7nz8n'; // Replace with your template ID
  final userID = 'YA-lXFLpGgM0PlIlP';
  final url = Uri.parse(
      'https://api.emailjs.com/api/v1.0/email/send'); // Replace with your email sending API endpoint
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'service_id': serviceID,
          'template_id': templateID,
          'user_id': userID,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          },
        },
      ));
  log('Email response: ${response.body}');
}
