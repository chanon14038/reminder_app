import 'package:reminder_app/model.dart';
import 'package:reminder_app/repo.dart';

class LastTimeMockRepository extends LastTimeRepository {
  @override
  Future<List<LastTimeItem>> load() async {
    return [
      const LastTimeItem(1, 'ซักผ้า', 7, null),
      const LastTimeItem(2, 'ถูบ้าน', 10, null),
      const LastTimeItem(3, 'เปลี่ยนผ้าปูที่นอน', 14, null),
      const LastTimeItem(4, 'โทรหาแม่', 3, null),
    ];
  }
}
