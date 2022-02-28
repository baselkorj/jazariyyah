import 'package:hive/hive.dart';
part 'db.g.dart';

// Accounts
@HiveType(typeId: 0)
class Bookmark extends HiveObject {
  @HiveField(1)
  late int chapter;

  @HiveField(2)
  late int page;
}
