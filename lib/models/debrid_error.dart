enum DebridErrorType { uncached, auth, network, api, unknown }

class DebridException implements Exception {
  final DebridErrorType type;
  final String message;

  const DebridException(this.type, this.message);

  bool get isUncached => type == DebridErrorType.uncached;

  @override
  String toString() => message;
}

String debridUserMessage(Object error) {
  if (error is DebridException) {
    if (error.type == DebridErrorType.uncached) {
      return 'This torrent is not cached yet. Try another source.';
    }
    return error.message;
  }

  final raw = error.toString();
  if (raw.contains('SocketException') || raw.contains('Failed host lookup')) {
    return 'Network error. Please check your connection.';
  }
  if (raw.contains('Invalid API key') || raw.contains('401')) {
    return 'Invalid API key. Please check your Real-Debrid settings.';
  }
  if (raw.contains('Account locked') || raw.contains('403')) {
    return 'Account locked or access denied. Please check your Real-Debrid account.';
  }
  if (raw.contains('not readily available') || raw.contains('not cached')) {
    return 'This torrent is not cached yet. Try another source.';
  }
  return 'Failed to add torrent to Real-Debrid.';
}
