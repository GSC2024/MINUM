class SaveData {
  final DateTime date;
  final double? ph;
  final double? tds;
  final double? turbidity;
  final double? orp;
  final int percentage;

  SaveData({
    required this.date,
    this.ph,
    this.tds,
    this.turbidity,
    this.orp,
    required this.percentage,
  });

  @override
  String toString() {
    return 'SaveData { date: $date, ph: $ph, tds: $tds, turbidity: $turbidity, percentage: $percentage, orp: $orp }';
  }
}
