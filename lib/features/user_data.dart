class UserData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final double? tds;
  final double? turbidity;
  final double? ph;


  UserData({this.firstName, this.lastName, this.email, this.tds, this.turbidity, this.ph});

  @override
  String toString() {
    return 'UserData { firstName: $firstName, lastName: $lastName, email: $email, tds: $tds, temperature: $turbidity, ph: $ph }';
  }
}
