import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_template/src/core/services/logger/logger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseMessaging fcm = FirebaseMessaging.instance;

class NotificationService {
  final _logger = getLogger('NotificationService');

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // Initialize local notifications first
    await _initializeLocalNotifications();

    // Request permissions based on platform
    if (Platform.isIOS) {
      // For iOS, we use Firebase Messaging's permission request
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      _logger.i('iOS notification authorization status: ${settings.authorizationStatus}');

      // Get APNs token
      String? apnsToken = await fcm.getAPNSToken();
      String? token = await fcm.getToken();
      _logger.i('APNs token: $apnsToken');
      _logger.i('FCM token: $token');

      if (settings.authorizationStatus != AuthorizationStatus.authorized) {
        _logger.e('User has not accepted permissions');
        return;
      }
    } else {
      // For Android, we use permission_handler
      if (!(await Permission.notification.request().isGranted)) {
        _logger.e('User has not accepted permissions');
        return;
      }
    }

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle background and terminated messages
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);

    // Handle messages when the app is terminated
    FirebaseMessaging.instance.getInitialMessage().then(_handleTerminatedMessage);
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/app_icon',
    );

    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: [
        DarwinNotificationCategory(
          'virtual_queue_notification_category_id',
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.allowAnnouncement,
          },
        ),
      ],
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _logger.i('Notification clicked: ${response.payload}');
      },
    );

    // For iOS, we need to request permissions again after initialization
    if (Platform.isIOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  static Future<String?> getToken() async {
    return await fcm.getToken();
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    log('Received a foreground message: ${message.messageId}');
    showNotification(message);
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    log('Received a background message: ${message.messageId}');
    showNotification(message);
  }

  Future<void> _handleTerminatedMessage(RemoteMessage? message) async {
    if (message != null) {
      log('Received a terminated message: ${message.messageId}');
      showNotification(message);
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;

    if (notification == null) {
      _logger.e('No notification data in message');
      return;
    }

    final androidDetails = const AndroidNotificationDetails(
      'virtual_queue_channel_notification_id',
      'Virtual Queue',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    final darwinDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      categoryIdentifier: 'virtual_queue_notification_category_id',
    );

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: darwinDetails,
    );

    try {
      await _flutterLocalNotificationsPlugin.show(
        message.hashCode,
        notification.title,
        notification.body,
        platformDetails,
        payload: message.data['payload'],
      );
      _logger.i('Local notification shown successfully');
    } catch (e) {
      _logger.e('Error showing local notification: $e');
    }
  }

  Future<void> checkNotificationPermissions() async {
    _logger.i('Checking notification permissions...');

    if (Platform.isIOS) {
      // Check FCM permissions
      final NotificationSettings fcmSettings = await fcm.getNotificationSettings();
      _logger.i('FCM authorization status: ${fcmSettings.authorizationStatus}');

      // Check local notification permissions
      final bool? localPermissions = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      _logger.i('Local notification permissions granted: $localPermissions');
    } else {
      final bool granted = await Permission.notification.isGranted;
      _logger.i('Android notification permission granted: $granted');
    }
  }
}
