import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Initializes Firebase services.
/// 
/// [options] are the Firebase options for the specific platform and environment.
Future<void> initializeFirebase(FirebaseOptions? options) async {
  await Firebase.initializeApp(
    options: options,
  );

  // Initialize Firebase Messaging
  await _initializeMessaging();
}

Future<void> _initializeMessaging() async {
  final messaging = FirebaseMessaging.instance;

  // Request permission (iOS/Web/Android 13+)
  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    // Subscribe to topics or perform other mobile-specific setup
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint("Handling a background message: ${message.messageId}");
}
