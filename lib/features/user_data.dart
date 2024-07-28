class UserData {
  final double? ph;
  final double? tds;
  final double? turbidity;
  final double? orp;

  UserData({
    this.ph,
    this.tds,
    this.turbidity,
    this.orp,
  });

  @override
  String toString() {
    return 'UserData { ph: $ph, tds: $tds, turbidity: $turbidity, orp: $orp }';
  }
}
