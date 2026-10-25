import 'package:flutter_study_hub/features/testing/sections/unit_testing/services/counter_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterService _counterService;

  // Runs before each test case.
  setUp(() {
    _counterService = CounterService();
  });

  // Runs only once before all tests.
  setUpAll(() {
    print('Starting all counter tests');
  },);

  test("Check initial value of counter is 0", () {
    expect(_counterService.count, 0);
  });

  test("Check counter increment is working", () {
    _counterService.incrementCount();

    expect(_counterService.count, 1);
  });

  test("Check counter decrement is working", () {
    _counterService.decrementCount();

    expect(_counterService.count, -1);
  });

  // Runs after each test case.
  tearDown(() {
  });

  // Runs once after all tests finish.
  tearDownAll(() {
    print('Finished all counter tests');
  });
}
