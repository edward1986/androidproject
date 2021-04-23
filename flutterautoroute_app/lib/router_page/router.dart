import 'package:auto_route/auto_route_annotations.dart';
import '../pages/first_page.dart';
import '../pages/home_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';



@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: HomePage, initial: true),
  AutoRoute(page: FirstPage),
  AutoRoute(page: SecondPage),
  AutoRoute(page: ThirdPage,),
  ])
class $FlutterRouter {}