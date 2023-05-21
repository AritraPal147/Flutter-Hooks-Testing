import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Hooks Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

/// A [Stream] of [String] that will periodically get the time (in one second intervals)
Stream<String> getTime() => Stream.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now().toIso8601String(),
    );

/// The widget that consumes a hook has to be a [HookWidget]
///
/// In this case, [HomePage] is a [HookWidget]
class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());

    return Scaffold(
      /// An [AppBar] cannot have a StreamBuilder because it is a PreferredSizeWidget
      appBar: AppBar(
        title: Text(dateTime.data ?? 'Home Page'),
      ),
    );
  }
}
