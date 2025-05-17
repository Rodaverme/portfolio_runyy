import 'dart:typed_data';
import 'package:dio/dio.dart';

class CloudinaryFotosServices {
  final String cloudName = 'dmsshdovm';
  final String uploadPreset = 'ynwwcafa';

  final Dio _dio = Dio();

  Future<String?> uploadImage({
    required Uint8List imageBytes,
    required String fileName,
  }) async {
    try {
      final url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

      final formData = FormData.fromMap({
        'upload_preset': uploadPreset,
        'file': MultipartFile.fromBytes(
          imageBytes,
          filename: fileName,
        ),
      });

      final response = await _dio.post(url, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url'];
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
