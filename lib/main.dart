import 'package:flutter/material.dart';
import 'package:null_activity_example/system_overlay_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemOverlayController.initialize();
  runApp(
    MaterialApp(
      home: TestWidget(),
    ),
  );
}

class TestWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('show window'),
          onPressed: () => openSystemWindow(),
        ),
      ),
    );
  }

  void openSystemWindow() {
    SystemOverlayController.showSimpleSystemOverlay(ThemeData.dark());
  }
}