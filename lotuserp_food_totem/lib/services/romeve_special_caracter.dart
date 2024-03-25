class RemoveSpecialCharacter {
  // remove caracteres especiais como . , - e outros
  String remove(String text) {
    return text.replaceAll(RegExp(r'[.,-]'), '');
  }
}
