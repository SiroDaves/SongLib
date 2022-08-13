import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:niddler_dart/niddler_dart.dart';

Future<Niddler> initNiddler() async {
  final niddlerBuilder = NiddlerBuilder()
    ..port = 0
    ..serverInfo = NiddlerServerInfo('SongLib', 'SongLib')
    ..bundleId = 'com.songlib'
    ..includeStackTrace = true
    ..maxCacheSize = 10 * 1024 * 1024;
  final niddler = niddlerBuilder.build();

  const debugger = bool.fromEnvironment('niddler_wait');
  staticLogger.d('Starting niddler. Waiting for debugger? $debugger');

  await niddler.start(waitForDebugger: debugger);

  niddler.install();
  staticLogger.d('Niddler is running');

  return niddler;
}
