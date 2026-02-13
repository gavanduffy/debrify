import 'package:flutter_test/flutter_test.dart';
import 'package:debrify/models/debrid_error.dart';

void main() {
  test('uncached debrid exception maps to user-facing uncached message', () {
    const error = DebridException(
      DebridErrorType.uncached,
      'This torrent is not cached yet. Try another source.',
    );

    expect(
      debridUserMessage(error),
      'This torrent is not cached yet. Try another source.',
    );
  });

  test('api key errors are normalized to settings guidance', () {
    expect(
      debridUserMessage(Exception('Invalid API key: 401')),
      'Invalid API key. Please check your Real-Debrid settings.',
    );
  });
}
