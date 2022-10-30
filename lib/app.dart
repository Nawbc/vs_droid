import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
import 'package:vs_droid/config_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vs_droid/double_pop.dart';
import 'package:vs_droid/error.dart';
import 'package:vs_droid/home.dart';
import 'package:vs_droid/init_vsc.dart';
import 'package:vs_droid/inner_drawer.dart';
import 'package:vs_droid/left_quick_bar.dart';

class VSDroid extends StatefulWidget {
  const VSDroid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VSDroid();
  }
}

class _VSDroid extends State<VSDroid> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfigModel>(
          create: (_) => ConfigModel(),
        ),
      ],
      child: const InnerVSDroid(),
    );
  }
}

class InnerVSDroid extends StatefulWidget {
  const InnerVSDroid({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InnerVSDroid();
  }
}

class _InnerVSDroid extends State<InnerVSDroid> {
  late ConfigModel _cm;
  final GlobalKey<InnerDrawerState> _innerDrawerKey = GlobalKey<InnerDrawerState>();

  appInit() async {
    _cm = Provider.of<ConfigModel>(context);
    await _cm.init();

    return await _cm.termuxUsrDir.exists() && _cm.isAppInit;
  }

  prepareTermuxEnv() {}

  initPtyEnv() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
      ),
      child: CupertinoApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        title: 'VS Droid',
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            child,
            maxWidth: 1270,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          );
        },
        home: DoublePop(
          child: InnerDrawer(
            key: _innerDrawerKey,
            onTapClose: true,
            swipe: false,
            boxShadow: const [],
            colorTransitionChild: Colors.transparent,
            colorTransitionScaffold: Colors.transparent,
            offset: const IDOffset.only(top: 0.2, right: 0, left: 0),
            scale: const IDOffset.horizontal(1),
            proportionalChildArea: true,
            borderRadius: 8,
            leftAnimationType: InnerDrawerAnimation.quadratic,
            rightAnimationType: InnerDrawerAnimation.quadratic,
            backgroundDecoration: const BoxDecoration(color: Colors.white),
            leftChild: const LeftQuickBar(),
            scaffold: CupertinoPageScaffold(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  FutureBuilder(
                    future: appInit(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError || snapshot.data == null) {
                          return const ErrorBoard();
                        } else if (snapshot.data == true) {
                          return const HomePage();
                        } else {
                          return const InitVscPage();
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                  Positioned(
                    top: 25,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        _innerDrawerKey.currentState?.open();
                      },
                      child: const Icon(
                        UniconsLine.bars,
                        color: Color(0xFF4285f4),
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
