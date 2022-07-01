abstract class PropertyData {
  PropertyData({
    this.lastChangeDate,
    this.lastChangeMileage,
    this.nextChangeDate,
    this.nextChangeMileage,
  });

  final double? lastChangeMileage;
  final DateTime? lastChangeDate;
  final double? nextChangeMileage;
  final DateTime? nextChangeDate;
}
