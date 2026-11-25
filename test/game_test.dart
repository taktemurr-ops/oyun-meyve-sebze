import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_meyve_sebze/oyun_meyve_sebze.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(meyveSebzeConfig.title.length, 33);
    expect(meyveSebzeConfig.tagline.length, 33);
    for (final s in meyveSebzeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(meyveSebzeConfig.gameId, meyveSebzeId);
    expect(meyveSebzeRules.gameId, meyveSebzeId);
    expect(meyveSebzeConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(meyveSebzeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: meyveSebzeId, optionalMechanics: meyveSebzeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(meyveSebzeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
