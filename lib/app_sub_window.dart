import 'package:desktop_lifecycle/desktop_lifecycle.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';

import 'common/widgets/event_widget.dart';

class AppSubWindow extends StatelessWidget {
  const AppSubWindow({
    Key? key,
    required this.windowController,
    required this.args,
  }) : super(key: key);

  final WindowController windowController;
  final Map? args;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Songlib'),
        ),
        body: Column(
          children: [
            if (args != null)
              Text(
                'Arguments: ${args.toString()}',
                style: const TextStyle(fontSize: 20),
              ),
            ValueListenableBuilder<bool>(
              valueListenable: DesktopLifecycle.instance.isActive,
              builder: (context, active, child) {
                if (active) {
                  return const Text('Window Active');
                } else {
                  return const Text('Window Inactive');
                }
              },
            ),
            TextButton(
              onPressed: () async {
                windowController.close();
              },
              child: const Text('Close this window'),
            ),
            Expanded(child: EventWidget(controller: windowController)),
          ],
        ),
      ),
    );
  }
}
