import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class AdaptiveLayoutPage extends StatelessWidget {
   const AdaptiveLayoutPage({super.key,this.body=const SizedBox(),this.color=Colors.white});
   final Widget body;
   final Color color;
  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => Container(
              color: Colors.white,
              child: Center(child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Container(
                    color: color,
                      child: body),
              )),
            ),
          ),
        },
      ),
    );
  }
}


