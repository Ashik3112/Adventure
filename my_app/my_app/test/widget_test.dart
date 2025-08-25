import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('App builds and shows splash screen', (
    WidgetTester tester,
  ) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const AdVentureApp());

    // Verify splash screen shows expected text.
    expect(find.text('AD-venture'), findsOneWidget);
    expect(find.text('Lets go!!!'), findsOneWidget);
  });
}
