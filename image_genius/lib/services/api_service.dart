// services/api_service.dart
import 'dart:math';

class ApiService {
  Future<String> generateImage(String prompt) async {

    
    print('Generating image for: "$prompt"');

    await Future.delayed(Duration(seconds: 2 + Random().nextInt(2)));

    if (Random().nextBool()) {
      throw Exception('Image generation failed. Please try again.');
    }

    return _getPlaceholderImage(prompt);
  }
  
  String _getPlaceholderImage(String prompt) {
    final index = prompt.hashCode.abs() % _placeholderImages.length;
    return _placeholderImages[index];
  }

  final List<String> _placeholderImages = [
    'https://i.pinimg.com/1200x/ec/15/c1/ec15c106e9275852f1c73d4de49ae2d0.jpg',
    'https://i.pinimg.com/1200x/b5/a7/d0/b5a7d06c1d5efb28dff940a866685a3c.jpg',
    'https://i.pinimg.com/736x/98/25/73/98257383d993f24dc3b70c0975b53955.jpg',
    'https://i.pinimg.com/1200x/08/80/a8/0880a8943b1a4a68e00d74255d08b242.jpg',
    'https://i.pinimg.com/1200x/26/10/7e/26107e52cc39630fe07477cb1ce9298e.jpg',
    'https://i.pinimg.com/1200x/f5/3e/44/f53e44c3a20a930abda30dff173025e5.jpg',
    'https://i.pinimg.com/1200x/59/71/e2/5971e257523aa0560fa20678901cf1b3.jpg',
    'https://i.pinimg.com/736x/fb/a7/88/fba788e0b6343bfac47422937ea8404a.jpg',
    'https://i.pinimg.com/736x/b8/b0/0b/b8b00bdf837669db4317388871a39632.jpg',
  ];
}