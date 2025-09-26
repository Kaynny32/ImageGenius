Image Genius - AI Image Generator
A beautiful Flutter application that generates images from text descriptions using AI technology.

📱 Features
Text-to-Image Generation: Describe what you want to see and generate corresponding images

Modern UI: Beautiful gradient backgrounds and smooth animations

Error Handling: Robust error handling with retry functionality

State Management: Efficient state management using Provider

Responsive Design: Works perfectly on both iOS and Android

🚀 Getting Started
Prerequisites
Flutter SDK (version 3.0 or higher)

Dart (version 2.17 or higher)

Android Studio or VS Code with Flutter extension

Installation
Clone the repository

git clone https://github.com/your-username/image-genius.git
cd image-genius
Install dependencies

flutter pub get
Run the application

flutter run
For Web Version

flutter create .
flutter run -d chrome
How to Use
Launch the app and you'll see the prompt screen

Describe your vision in the text field (e.g., "A beautiful sunset over mountains")

Tap "Generate" to create your image

Wait 2-3 seconds while the AI processes your request

View the result and choose to:

"Try Another" - Generate a new image with the same prompt

"New Prompt" - Return to input screen with text preserved

🔧 Technical Details
Architecture
Framework: Flutter 3.0+

State Management: Provider

Navigation: Navigator 2.0

HTTP Client: Dio

Key Dependencies
yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5        # State management
  dio: ^5.0.0             # HTTP requests
  cached_network_image: ^3.3.0  # Image caching
API Integration
The app uses a mock AI service that:

Simulates 2-3 second processing time

Has 50% success rate (as per test requirements)

Returns beautiful placeholder images from Picsum

📸 Demo
Screen Flow
Prompt Screen: Input field with "Describe what you want to see..." placeholder

Loading State: Circular progress indicator with your prompt text

Result Screen: Generated image with action buttons

Error State: Friendly error message with retry option

Demo Scenarios to Test
✅ Successful image generation

✅ Error handling and retry functionality

✅ Text preservation when returning to prompt screen

✅ Button state management (disabled when empty)

🎨 UI/UX Features
Custom Gradients: Beautiful animated backgrounds

Smooth Transitions: Elegant page transitions and animations

Adaptive Layout: Responsive design for various screen sizes

Loading States: Engaging loading animations

Error States: User-friendly error messages

🔍 Testing
Run the test suite with:

flutter test
Manual Testing Checklist
Text input validation

Generate button enabled/disabled states

Image generation success flow

Error handling and retry mechanism

Navigation between screens

Text preservation on back navigation

📊 Performance
Fast Startup: Optimized initial load time

Smooth Animations: 60fps animations throughout

Efficient Rendering: Optimized rebuilds with Provider

Image Caching: Efficient image loading and caching

🤝 Contributing
Fork the repository

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📝 License
This project is licensed under the MIT License - see the LICENSE.md file for details.

🙏 Acknowledgments
Flutter team for the amazing framework

Picsum for providing beautiful placeholder images

Provider package for simple state management
