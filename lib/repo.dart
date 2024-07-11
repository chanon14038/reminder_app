import "package:reminder_app/model.dart";

abstract class LastTimeRepository {
  Future<List<LastTimeItem>> load();
}
