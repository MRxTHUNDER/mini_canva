import 'package:flutter/material.dart';

class TextItem {
  String text;
  double fontSize;
  Color fontColor;
  Offset position;

  TextItem({
    required this.text,
    required this.fontSize,
    required this.fontColor,
    required this.position,
  });

  TextItem copyWith({
    String? text,
    double? fontSize,
    Color? fontColor,
    Offset? position,
  }) {
    return TextItem(
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      fontColor: fontColor ?? this.fontColor,
      position: position ?? this.position,
    );
  }
}

class EditorProvider extends ChangeNotifier {
  double _fontSize = 16.0;
  Color _fontColor = Colors.black;
  List<TextItem> _texts = [];
  
  // History stack for undo functionality
  List<List<TextItem>> _history = [];

  double get fontSize => _fontSize;
  Color get fontColor => _fontColor;
  List<TextItem> get texts => _texts;

  void updateFontSize(double newSize) {
    _fontSize = newSize;
    _saveState(); // Save state for undo
    notifyListeners();
  }

  void updateFontColor(Color newColor) {
    _fontColor = newColor;
    _saveState(); // Save state for undo
    notifyListeners();
  }

  void addText(String newText, Offset position) {
    if (newText.isNotEmpty) {
      _saveState(); // Save state for undo
      _texts.add(TextItem(
        text: newText,
        fontSize: _fontSize,
        fontColor: _fontColor,
        position: position,
      ));
      notifyListeners();
    }
  }

  void updateTextPosition(int index, Offset newPosition) {
    _saveState(); // Save state for undo
    _texts[index].position = newPosition;
    notifyListeners();
  }

  void deleteText(int index) {
    _saveState(); // Save state for undo
    _texts.removeAt(index);
    notifyListeners();
  }

  void undo() {
    if (_history.isNotEmpty) {
      _texts = _history.removeLast();
      notifyListeners();
    }
  }

  void _saveState() {
    // Save a copy of the current state to the history stack
    _history.add(List.from(_texts.map((textItem) => textItem.copyWith())));
  }
}
