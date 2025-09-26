// services/api_service.dart
import 'dart:math';

class ApiService {
  Future<String> generateImage(String prompt) async {
    // Имитация задержки 2-3 секунды
    await Future.delayed(Duration(seconds: 2 + Random().nextInt(2)));
    
    // ~50% шанс ошибки как в задании
    if (Random().nextBool()) {
      throw Exception('AI service is busy. Please try again.');
    }
    
    // Успех - возвращаем изображение с уникальным seed на основе промпта
    final seed = prompt.hashCode.abs();
    return 'https://picsum.photos/600/600?seed=$seed';
  }
}