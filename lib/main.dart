import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'utilis/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'utilis/shared_pref.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          child: const MyApp(),
          supportedLocales: const [ Locale("ar","IQ"),Locale("en", "US")],
          path: 'assets/translations')
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    SharedPref.getLocal().then((locale) {
      context.setLocale(locale);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      builder: EasyLoading.init(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales:  context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
