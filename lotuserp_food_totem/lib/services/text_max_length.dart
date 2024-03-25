class TextMaxLenght {

  String limitText(String txt, int maxLength) {
    String txtFormatted = txt.length <= maxLength ? txt : '${txt.substring(0, maxLength)}...';
    return txtFormatted;
  }
}