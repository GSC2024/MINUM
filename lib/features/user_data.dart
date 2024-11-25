class UserData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final double? tds;
  final double? turbidity;
  final double? ph;
  final double? orp;

  UserData(
      {this.firstName,
      this.lastName,
      this.email,
      this.tds,
      this.turbidity,
      this.ph,
      this.orp});

  @override
  String toString() {
    return 'UserData { firstName: $firstName, lastName: $lastName, email: $email, tds: $tds, temperature: $turbidity, ph: $ph, orp: $orp }';
  }
}
