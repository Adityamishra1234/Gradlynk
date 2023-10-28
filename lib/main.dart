import 'dart:convert';
import 'dart:io';
// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:gif_view/gif_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentpanel/Test/testScreen.dart';
import 'package:studentpanel/binding/app_bindings.dart';
import 'package:studentpanel/binding/applicationdetails.dart';
import 'package:studentpanel/binding/applicationsummary.dart';
import 'package:studentpanel/binding/coursesearch.dart';
import 'package:studentpanel/binding/dashboard.dart';
import 'package:studentpanel/binding/detailbinding.dart';
import 'package:studentpanel/binding/finalshortlist.dart';
import 'package:studentpanel/binding/profilepage.dart';
import 'package:studentpanel/binding/reviewshortlist.dart';
import 'package:studentpanel/binding/trackapplication.dart';
import 'package:studentpanel/binding/uploaddocument.dart';
import 'package:studentpanel/binding/visasummary.dart';
import 'package:studentpanel/fcm/firebase_options.dart';
import 'package:studentpanel/middlewares/welcomeViewMiddleWare.dart';
import 'package:studentpanel/presentation/features/event_history/event_history_view.dart';
import 'package:studentpanel/ui/controllers/basecontroller.dart';
import 'package:studentpanel/ui/controllers/dashboardcontroller.dart';
import 'package:studentpanel/ui/models/usermodel.dart';
import 'package:studentpanel/ui/screen/Delete/assigneeinformation.dart';
import 'package:studentpanel/ui/screen/Login_Module/LoginScreen.dart';
import 'package:studentpanel/ui/screen/Profile_module_2/profile_view.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch2.dart';
import 'package:studentpanel/ui/screen/dashboard/bookanappointment.dart';
import 'package:studentpanel/ui/screen/fund/fund_parameter.dart';
import 'package:studentpanel/ui/screen/fund/fund_requiremen.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/raise_new_ticket.dart';
import 'package:studentpanel/ui/screen/gradlynk_support/suggestedimprovisation.dart';
import 'package:studentpanel/ui/screen/internet_connection.dart';
import 'package:studentpanel/ui/screen/letsGetStarted/letsGetStartedMainVIew.dart';
import 'package:studentpanel/ui/screen/mark_attendance/eventdocumentupload.dart';
import 'package:studentpanel/ui/screen/receiveACallback/ui/recieveACallback_view.dart';
import 'package:studentpanel/ui/screen/registeration/registeration_main_view.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication2.dart';
import 'package:studentpanel/ui/screen/Visa/visasummary.dart';
import 'package:studentpanel/ui/screen/Profile_Module/profilepage.dart';
import 'package:studentpanel/ui/screen/track_application/applicationdetail.dart';
import 'package:studentpanel/ui/screen/My_Application/applicationsummary.dart';
import 'package:studentpanel/ui/screen/course_search/coursesearch.dart';
import 'package:studentpanel/ui/screen/course_search/finalshortlist.dart';
import 'package:studentpanel/ui/screen/course_search/reviewshortlist.dart';
import 'package:studentpanel/ui/screen/imageviewerscreen.dart';
import 'package:studentpanel/ui/screen/login%20copy.dart';
import 'package:studentpanel/ui/screen/lunchingpage.dart';
import 'package:studentpanel/ui/screen/Delete/mydocument.dart';
import 'package:studentpanel/ui/screen/otpscreen.dart';
import 'package:studentpanel/ui/screen/dashboard.dart';
import 'package:studentpanel/ui/screen/Delete/detail.dart';
import 'package:studentpanel/ui/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentpanel/ui/screen/Delete/sortcopy.dart';
import 'package:studentpanel/ui/screen/test/documentdownload.dart';
import 'package:studentpanel/ui/screen/test/stage_profilemodule.dart';
import 'package:studentpanel/ui/screen/test/timepickertest.dart';
import 'package:studentpanel/ui/screen/track_application/testautoscrolllistview.dart';
import 'package:studentpanel/ui/screen/track_application/trackapllication.dart';
import 'package:studentpanel/ui/screen/upload_document/uploaddocument.dart';
import 'package:studentpanel/ui/screen/welcomeScreen/welcome_view.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/widgets/phonepelikeanimation.dart';
import 'package:studentpanel/widgets/scrolltabbar.dart';
import 'ui/screen/Login_Module/animationtest.dart';
import 'ui/screen/My_Application/applicationcompletedetail.dart';
import 'ui/screen/countryGuide/countryguide.dart';
import 'ui/screen/dashboard/scheduleExpertCall.dart';

import 'ui/screen/gradlynk_support/track_your_tickets.dart';
import 'ui/screen/test/test.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';

// import files from firebase
import 'fcm/firebase_options.dart';
import 'fcm/message.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> onActionSelected(String value) async {
  switch (value) {
    case 'subscribe':
      {
        print(
          'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
        );
        await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
        print(
          'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
        );
      }
      break;

    case 'unsubscribe':
      {
        print(
          'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
        );
        await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
        print(
          'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
        );
      }
      break;
    case 'get_apns_token':
      {
        if (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.macOS) {
          print('FlutterFire Messaging Example: Getting APNs token...');
          String? token = await FirebaseMessaging.instance.getAPNSToken();
          print('FlutterFire Messaging Example: Got APNs token: $token');
        } else {
          print(
            'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
          );
        }
      }
      break;
    default:
      break;
  }
}

createtoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // var id = await prefs.getInt('id')!;

  var token = await FirebaseMessaging.instance.getToken(
      vapidKey:
          'BNKkaUWxyP_yC_lki1kYazgca0TNhuzt2drsOrL6WrgGbqnMnr8ZMLzg_rSPDm6HKphABS0KzjPfSqCXHXEd06Y');

  print("token");
  print(token);
  await prefs.setString('token', '$token');
}

// FCM send Notification using Token
sendPushMessage(String token) async {
  if (token == null) {
    print('Unable to send FCM message, no token exists.');
    return;
  }

  try {
    await http.post(
      Uri.parse('https://api.rnfirebase.io/messaging/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: constructFCMPayload(token),
    );
    print('FCM request for device sent!');
  } catch (e) {
    print(e);
  }
}

int _messageCount = 0;
String constructFCMPayload(String? token) {
  print(token);
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}

Future<void> main() async {
  String? initialMessage;
  bool _resolved = false;
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  FirebaseMessaging.instance.getInitialMessage().then((value) {
    print(value);
    _resolved = true;
    initialMessage = value?.data.toString();
  });

  FirebaseMessaging.onMessage.listen(showFlutterNotification);

//Notification on tap process

//IOS Notification on tap process
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("object");
    final temp = message.data;
    temp.forEach((key, value) {
      print(key);
      print(value);

      if (key == "test") {
        if (value == "value") {
          Get.to(const TestScreen());
        }
      }
    });
  });

//IOS Notification on tap process

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemStatusBarContrastEnforced: true));

  // Plugin must be initialized before using
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await Future.delayed(Duration(seconds: 1));
  await onActionSelected;
  await createtoken();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel? userModel;
  // late final GifController controller;

  bool dashboardscreen = false;

  @override
  void initState() {
    hideScreen();
    super.initState();
  }

  Future<void> hideScreen() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String phonenumber = sharedPreferences.getString("phonenumber").toString();

    // if (getNUllChecker(phonenumber) == false) {
    //   var controller = Get.put(BaseController(), permanent: true);
    // }
    if (Platform.isIOS) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        FlutterSplashScreen.hide();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 5100), () {
        FlutterSplashScreen.hide();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "S2C_studentpanel",

      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      // Create Route
      getPages: [
        GetPage(
          name: "/",
          page: () => WelcomeView(),
        ),
        GetPage(
          name: ReceiveACallBackView.routeNamed,
          page: () => ReceiveACallBackView(),
        ),
        GetPage(
          name: FundParameter.routeNamed,
          page: () => FundParameter(),
        ),
        GetPage(
          name: FundPlan.routenamed,
          page: () => FundPlan(),
        ),

        GetPage(
          name: LetsGetStartedMainView.routeNamed,
          page: () => LetsGetStartedMainView(),
        ),

        GetPage(
          name: EventHistoryView.routeName,
          page: () => EventHistoryView(),
        ),
        GetPage(
          name: Fundrequirement.routenamed,
          page: () => Fundrequirement(),
        ),
        // GetPage(
        //   name: "/",
        //   page: () => LoginCopy(),
        //   transition: Transition.fade,
        // ),
        GetPage(
          name: LoginCopy.routeNamed,
          page: () => const LoginCopy(),
          transition: Transition.fade,
        ),
        // GetPage(
        //   name: LoginScreen.routeNamed,
        //   page: () => LoginScreen(),
        //   transition: Transition.fade,
        // ),
        // GetPage(
        //   name: Login.routeNamed,
        //   page: () => const Login(),
        //   transition: Transition.fade,
        // ),
        GetPage(
          name: RegisterationMainView.routeNmaed,
          page: () => const RegisterationMainView(),
          transition: Transition.fade,
        ),
        GetPage(
          name: MyDocument.routeNamed,
          page: () => const MyDocument(),
          transition: Transition.fade,
        ),
        GetPage(
          name: DashBoard.routeNamed,
          transition: Transition.cupertino,
          binding: DashBoardBinding(),
          page: () => const DashBoard(),
        ),
        // GetPage(
        //     name: ProfilePageCopy1.routeNamed,
        //     transition: Transition.cupertino,
        //     page: () => ProfilePageCopy1(),
        //     binding: ProfilePageBinding()),
        GetPage(
            name: ProfilePageCopy.routeNamed,
            transition: Transition.zoom,
            page: () => ProfilePageCopy(),
            binding: ProfilePageBinding()),
        GetPage(
            name: DetialScreen.routeNamed,
            page: () => const DetialScreen(),
            transition: Transition.fade,
            binding: DetailBinding()),

        //AnimationaPhonepe
        GetPage(
          name: AnimationaPhonepe.routeNamed,
          transition: Transition.fade,
          page: () => const AnimationaPhonepe(),
        ),
        GetPage(
          name: OTPScreen.routeNamed,
          transition: Transition.fade,
          page: () => OTPScreen(),
        ),
        // GetPage(
        //     name: UploadDocument.routeNamed,
        //     transition: Transition.fade,
        //     page: () =>  UploadDocument(),
        //     binding: UploadDocumentBinding()),
        GetPage(
          name: ImageViewerScreen.routeNamed,
          transition: Transition.fade,
          page: () => const ImageViewerScreen(),
        ),
        GetPage(
          name: CourseSearch2.routeNamed,
          transition: Transition.fade,
          binding: CourseSearchBinding(),
          page: () => const CourseSearch2(),
        ),

        GetPage(
          name: Test1.routeNamed,
          transition: Transition.fade,
          page: () => const Test1(),
        ),

        GetPage(
          name: TestAutoScrollListView.routeNamed,
          transition: Transition.fade,
          page: () => const TestAutoScrollListView(),
        ),
        GetPage(
            name: TrackApplication.routeNamed,
            transition: Transition.fade,
            page: () => const TrackApplication(),
            binding: TrackApplicationBinding()),
        GetPage(
            name: TrackApplicationCopy.routeNamed,
            transition: Transition.fade,
            page: () => const TrackApplicationCopy(),
            binding: TrackApplicationBinding()),
        GetPage(
          name: LunchingPage.routeNamed,
          transition: Transition.cupertino,
          page: () => const LunchingPage(),
        ),
        GetPage(
          name: AnimationTest.routeNamed,
          transition: Transition.cupertino,
          page: () => const AnimationTest(),
        ),

        GetPage(
          name: ScrollTabBar.routeNamed,
          transition: Transition.cupertino,
          page: () => ScrollTabBar(),
        ),
        GetPage(
            name: ApplicationSummary.routeNamed,
            transition: Transition.cupertino,
            page: () => ApplicationSummary(),
            binding: ApplicationSummaryBinding()),
        GetPage(
            name: ApplicationDetail.routeNamed,
            transition: Transition.cupertino,
            page: () => const ApplicationDetail(),
            binding: ApplicationDetailBinding()),
        GetPage(
            name: FinalShortList.routeNamed,
            transition: Transition.cupertino,
            page: () => FinalShortList(),
            binding: FinalShortListBinding()),
        GetPage(
          name: ReviewShortList.routeNamed,
          page: () => ReviewShortList(),
          transition: Transition.fade,
          binding: ReviewShortListBinding(),
        ),

        GetPage(
          name: AssigneeInformationCopy.routeNamed,
          page: () => const AssigneeInformationCopy(),
          transition: Transition.fade,
        ),

        GetPage(
            name: VisaSummary.routeNamed,
            page: () => VisaSummary(),
            transition: Transition.fade,
            binding: VisaSummaryBinding()),
        GetPage(
            name: UploadDocument.routeNamed,
            page: () => UploadDocument(),
            transition: Transition.fade,
            binding: UploadDocumentBinding()),
        GetPage(
          name: DocumentTest.routeNamed,
          page: () => const DocumentTest(),
          transition: Transition.fade,
        ),
        GetPage(
          name: TimepickerDemo.routeNamed,
          page: () => const TimepickerDemo(),
          transition: Transition.fade,
        ),
        GetPage(
          name: StageProgress.routeNamed,
          page: () => const StageProgress(),
          transition: Transition.fade,
        ),
        GetPage(
          name: ApplicationCompleteDetails.routeNamed,
          page: () => const ApplicationCompleteDetails(),
          transition: Transition.fade,
        ),
        GetPage(
          name: InternetConnectionStatusScreen.routeNamed,
          page: () => InternetConnectionStatusScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: ScheduleExpertCall.routeNamed,
          page: () => ScheduleExpertCall(),
          transition: Transition.fade,
        ),
        GetPage(
          name: BookAnAppointment.routeNamed,
          page: () => BookAnAppointment(),
          transition: Transition.fade,
        ),
        GetPage(
          name: CountryGuide.routeNamed,
          page: () => CountryGuide(),
          transition: Transition.fade,
        ),
        GetPage(
          name: TestWidget.routeNamed,
          page: () => const TestWidget(),
          transition: Transition.fade,
        ),
        GetPage(
          name: TrackyourTickets.routeNamed,
          page: () => TrackyourTickets(),
          transition: Transition.fade,
        ),
        GetPage(
          name: Suggestedimprovisation.routeNamed,
          page: () => Suggestedimprovisation(),
          transition: Transition.fade,
        ),
        GetPage(
          name: RaiseYourTicket.routeNamed,
          page: () => RaiseYourTicket(),
          transition: Transition.fade,
        ),
        GetPage(
            name: ProfileView.routeNamed,
            transition: Transition.fade,
            // page: () => ProfilePageCopy1(),
            page: () => const ProfileView(),
            binding: ProfilePageBinding()),
        GetPage(
          name: EventDocumentUpload.routeNamed,
          transition: Transition.fade,
          page: () => EventDocumentUpload(),
        ),
      ],
    );
  }
}
