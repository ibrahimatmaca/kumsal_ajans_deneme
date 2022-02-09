class FieldValidator {
  static final FieldValidator instance = FieldValidator._init();
  FieldValidator._init();

  String? passwordValidator(String? value) {
    if (value!.length < 6) {
      return 'Şifre 6 haneden az olamaz';
    }
    return null;
  }
}
