import 'package:etam_planning/home/home.dart';
import 'package:etam_planning/providers/color_provider.dart';
import 'package:etam_planning/views/cells.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'home/HomePage.dart';
import 'package:flutter_localization/flutter_localization.dart';

void main() {
  runApp(const EtamPlanning());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class EtamPlanning extends StatefulWidget {
  const EtamPlanning({Key? key}) : super(key: key);

  @override
  State<EtamPlanning> createState() => _EtamPlanningState();
}

class _EtamPlanningState extends State<EtamPlanning> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final ColorsProvider colorsProvider = ColorsProvider();

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('fr', AppLocale.FR),
      ],
      initLanguageCode: 'fr',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        // title: 'Etam planning Rodez',
        // scrollBehavior: MyCustomScrollBehavior(),
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),
        routes: {
          '/': (context) => const Home(),
        },
        //home: const HomePage(title: 'Time planner'),
        //home: const Cells(),
      ),
    );
  }
}

mixin AppLocale {
  static const String title = 'title';

  static const Map<String, dynamic> EN = {title: 'Localization'};
  static const Map<String, dynamic> FR = {title: 'Localization'};
}
