import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class CloudinaryFotosServices {
  final String cloudName = 'dmsshdovm';
  final String uploadPreset = 'ynwwcafa';

  Future<String?> uploadImage({
    required Uint8List imageBytes,
    required String fileName,
  }) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/image/upload');

      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            imageBytes,
            filename: fileName,
          ),
        );

      final response = await request.send();

      if (response.statusCode == 200) {
        final resStream = await response.stream.bytesToString();
        final resData = json.decode(resStream);
        return resData['secure_url'];
      } else {
        print('Error al subir imagen: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error en uploadImage: $e');
      return null;
    }
  }
}
