
import 'package:flutter/material.dart';
import 'package:image_genius/services/api_service.dart';

class ProjectData with ChangeNotifier {
  String _prompt = '';
  String? _generatedImageUrl; 
  bool _isGenerating = false;
  String? _error;
  
  final ApiService _apiService = ApiService();

  String get prompt => _prompt;
  String? get generatedImageUrl => _generatedImageUrl;
  bool get isGenerating => _isGenerating;
  String? get error => _error;
  
  void savePrompt(String prompt) {
    _prompt = prompt;
    notifyListeners();
  }
  
  Future<void> generateImage() async {
    if (_prompt.isEmpty) return;
    
    _isGenerating = true;
    _error = null;
    _generatedImageUrl = null;
    notifyListeners();
    
    try {

      await Future.delayed(Duration(milliseconds: 100));

      _generatedImageUrl = await _apiService.generateImage(_prompt);
    } catch (e) {
      _error = e.toString();
      _generatedImageUrl = null;
    } finally {
      _isGenerating = false;
      notifyListeners();
    }
  }
  
  Future<void> retryGeneration() async {
    await generateImage();
  }
  
  void clear() {
    _prompt = '';
    _generatedImageUrl = null;
    _error = null;
    _isGenerating = false;
    notifyListeners();
  }
}