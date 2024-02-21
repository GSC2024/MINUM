class UserData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? tds;
  final int? temperature;
  final double? ph;
  final int? ec;

  UserData({this.firstName, this.lastName, this.email, this.tds, this.temperature, this.ph, this.ec});

  @override
  String toString() {
    return 'UserData { firstName: $firstName, lastName: $lastName, email: $email, tds: $tds, temperature: $temperature, ph: $ph, ec: $ec }';
  }
}
