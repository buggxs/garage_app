enum CarPropertyStatus { danger, warning, success }

extension CarPropertyStatusExtension on CarPropertyStatus {
  static const Map<CarPropertyStatus, String> _map =
      <CarPropertyStatus, String>{
    CarPropertyStatus.danger: 'danger',
    CarPropertyStatus.warning: 'warning',
    CarPropertyStatus.success: 'success'
  };

  String get status {
    return _map[this] ?? '';
  }
}
