import 'package:reminder_app/model.dart';
import 'package:reminder_app/repo.dart';

class LastTimeMockRepository extends LastTimeRepository {
  @override
  Future<List<LastTimeItem>> load() async {
    await Future.delayed(const Duration(seconds: 2));
    return  [
      LastTimeItem(id: 1, tasks: 'ซักผ้า', cycleDays:7),
      LastTimeItem(id: 2, tasks: 'ถูบ้าน', cycleDays: 10),
      LastTimeItem(id: 3, tasks: 'เปลี่ยนผ้าปูที่นอน', cycleDays: 14),
      LastTimeItem(id: 4, tasks: 'โทรหาแม่', cycleDays: 3),
    ];
  }
}
