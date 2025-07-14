import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const Color primaryColor = Color(0xFF6200EE);
const Color secondaryColor = Color(0xFF03DAC6);

void main() {
  group("Case Color", () {
    // 色がプライマリー同士なので成功するテスト
    test("色がプライマリーか？", () {
      final actual = primaryColor;
      expect(actual, primaryColor);
    });

    // 色が違うので失敗するテスト
    test("色がオレンジか？", () {
      final actual = Color(0xFFfcba03);
      expect(actual, secondaryColor);
    });
  });
}