<div style="display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0;">
  <div style="background-color: #ffcccc; border: 2px solid #ff4d4d; border-radius: 10px; padding: 20px; width: 100%; max-width: 600px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); color: #333; font-family: Arial, sans-serif; text-align: center;">
    <h2 style="color: #ff4d4d; font-size: 24px; margin-bottom: 10px;">🚨 Macros Feature Suspended 🚨</h2>
    <p style="font-size: 16px; margin: 10px 0;"><span style="font-weight: bold; color: #e60000;">The macros feature is permanently suspended.</span></p>
    <p style="font-size: 16px; margin: 10px 0;">Due to changes, We Will Stop this Package in future.</p>
    <p style="font-size: 14px; color: #666; margin: 10px 0;">We apologize for any inconvenience this may cause. Thank you for your understanding.</p>
    <a href="https://dart.dev/language/macros" style="display: inline-block; margin-top: 20px; padding: 10px 15px; background-color: #ff4d4d; color: white; text-decoration: none; border-radius: 5px; font-weight: bold; transition: background-color 0.3s;">Learn More</a>
  </div>
</div>


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
  singleton_macro: ^0.0.2-dev.1
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

