import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_dd360/core/bloc/global_bloc.dart';
import 'package:test_dd360/core/util/apcolors.dart';
import 'package:test_dd360/features/home/presentation/bloc/comics/comics_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/events/events_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/marvel/marvel_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/series/series_bloc.dart';
import 'package:test_dd360/features/home/presentation/bloc/stories/stories_bloc.dart';
import 'package:test_dd360/flavor.dart';
import 'package:test_dd360/l10n/l10n.dart';
import 'package:test_dd360/navigator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  onGoToRoute(Routes route) {
    String? routeName = AppNavigator.getNameByRoute(route);
    String? currentRouteName = AppNavigator.getCurrentRoute();
    if (routeName != currentRouteName) {
      AppNavigator.push(route);
    }
  }

  bool _isInForeground = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _isInForeground = state == AppLifecycleState.resumed;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<GlobalBloc>()),
          BlocProvider(create: (context) => di.sl<MarvelBloc>()),
          BlocProvider(create: (context) => di.sl<ComicsBloc>()),
          BlocProvider(create: (context) => di.sl<EventsBloc>()),
          BlocProvider(create: (context) => di.sl<SeriesBloc>()),
          BlocProvider(create: (context) => di.sl<StoriesBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:
              Flavor.instance.value == FlavorType.dev ? true : false,
          title: 'DD360',
          theme: ThemeData(
            primaryColor: APColors.whitePure,
            scaffoldBackgroundColor: APColors.whiteDD260,
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.light(
              primary: APColors.primaryMain,
              primaryContainer: APColors.primaryMain.withOpacity(0.8),
            ),
            scrollbarTheme: const ScrollbarThemeData().copyWith(
                thumbColor: MaterialStateProperty.all(
              APColors.gray50,
            )),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: L10n.all,
          navigatorKey: kIsWeb ? null : AppNavigator.navigatorKey,
          //  scaffoldMessengerKey: scaffoldMessengerKey,
          onGenerateRoute: kIsWeb ? null : AppNavigator.onGenerateRoute,
        ),
      ),
    );
  }
}

Future<void> launchUrlNotification(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
