# Singleton Macro

A Dart package that provides a `Singleton` macro to transform classes into singletons automatically. This package leverages Dart's macro system to enforce the singleton pattern on the annotated classes.

## Features

- Automatic singleton implementation.
- Ensures a single instance of the class.
- Simplifies singleton pattern usage in Dart.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  singleton_macro: ^0.0.3-dev.2
```

## Usage
Annotate your class with @Singleton to make it a singleton:
```dart
// lib/main.dart
import 'package:singleton_macro/singleton_macro.dart';

@Singleton()
class MySingletonClass {
  String name = "foo";
}

void main() {
  final instance1 = MySingletonClass();
  print(instance1.name);  // Output: foo

  final instance2 = MySingletonClass();
  instance2.name = "bar";
  print(instance1.name);  // Output: bar

  print(identical(instance1, instance2));  // Output: true
}


```
## Run
```bash
dart --enable-experiment=macros run lib/main.dart
```



## Contributing
Contributions are welcome! Please submit pull requests or create issues for any improvements or bugs you find.

[Github Repo](https://github.com/antinna/singleton_macro)

## Sponsor
If you find this project helpful, consider sponsoring it on GitHub:

[Github Sponsor](https://github.com/sponsors/Manishmg3994)


Follow on YouTube
For more tutorials and project walkthroughs, subscribe to our YouTube channel:

[@Antinna YouTube Channel](https://m.youtube.com/antinna)

---
Maintained by [Manish Gautam](https://github.com/Manishmg3994)

---

---
Powered By [Antinna](https://github.com/antinna)

