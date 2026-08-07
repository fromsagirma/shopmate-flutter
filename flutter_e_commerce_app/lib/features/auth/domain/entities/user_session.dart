import 'package:hive/hive.dart';

part 'user_session.g.dart';

@HiveType(typeId: 0)
class UserSession {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final String username;

  UserSession({
    required this.token,
    required this.username,
  });
}
