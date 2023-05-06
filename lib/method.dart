class Contact {
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? email;
  final String? image;
  final String? sms;

  Contact(
      {required this.firstname,
      required this.lastname,
      required this.phone,
      required this.email,
      required this.sms,
      this.image});
}
