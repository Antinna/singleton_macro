import 'package:singleton_macro/singleton_macro.dart';

@Singleton()
class ClassName {
  String name = "foo";
}

void main(List<String> args) {
  final instance = ClassName();
  print(instance.name);
  final instance2 = ClassName();
  instance2.name = "bar";
  print(instance.name);
}
