import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rise_of_civilization/main.dart';

void main() {
  testWidgets('App boots to splash', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: RiseOfCivilizationApp()),
    );
    await tester.pump();
    expect(find.textContaining('CIVILIZATION'), findsOneWidget);
  });
}
