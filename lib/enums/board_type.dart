enum BoardType {
  urgent,
  running,
  ongoing,
}

extension BoardTypeExtension on BoardType {
  String get displayName {
    switch (this) {
      case BoardType.urgent:
        return 'Urgent';
      case BoardType.running:
        return 'Running';
      case BoardType.ongoing:
        return 'Ongoing';
    }
  }
}
