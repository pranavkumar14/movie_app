import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'adaptive_layout.dart';

@RoutePage()
class ScreenWrapperPage extends StatelessWidget implements AutoRouteWrapper{
  const ScreenWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies App'),),
      body: const AdaptiveLayoutPage(
        color: Colors.transparent,
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: AutoRouter(),
          ),
        ),),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}