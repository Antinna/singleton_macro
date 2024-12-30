import '_macro.dart'; 
import 'dart:async';



/// The `@Singleton` macro ensures that a class is treated as a singleton,
/// allowing only a single instance to exist throughout the application's lifecycle.
///
/// ## Usage
/// Annotate a class with `@Singleton()` to apply the singleton behavior:
/// 
/// ```dart
/// @Singleton()
/// class Class {
///   String name = "foo";
/// }
/// ```
/// 
/// The macro will automatically generate:
/// - A private static field to hold the singleton instance.
/// - A factory constructor to return the singleton instance.
/// - A private default constructor to prevent direct instantiation.
///
/// ## Example
/// ```dart
/// @Singleton()
/// class MySingleton {
///   String value = "Initial";
/// }
///
/// void main() {
///   final instance1 = MySingleton();
///   print(instance1.value); // Outputs: "Initial"
///
///   final instance2 = MySingleton();
///   instance2.value = "Updated";
///   
///   // Both instances refer to the same object
///   print(instance1.value); // Outputs: "Updated"
/// }
/// ```
///
/// ## Notes
/// - The class should not be abstract or sealed. If it is, a diagnostic error will be reported.
/// - Avoid defining your own default constructor, as it will conflict with the generated one.
///
/// Applying this macro ensures thread-safe singleton behavior for your class in Dart.
macro class Singleton implements ClassDeclarationsMacro {
 const Singleton();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
     final defaultClassConstructor = await builder.constructorsOf(clazz);
    if (defaultClassConstructor.isNotEmpty) {
            builder.report(  Diagnostic( DiagnosticMessage(
              r'A default factory singleton constructor was created with `@Singleton()` Macro',
              target: defaultClassConstructor.first.asDiagnosticTarget,
            ),
            Severity.error,
       
          correctionMessage:' * Remove This ${clazz.identifier.name}() constructor. *'));
            
      
    }
    if(clazz.hasAbstract || clazz.hasSealed){
  builder.report(  Diagnostic( DiagnosticMessage(
              '<= Abstract classes can\'t be instantiated.Try creating an instance of a concrete subtype. or',
              target: clazz.asDiagnosticTarget,
            ),
            Severity.error,
            correctionMessage:"* Remove This ${(clazz.hasAbstract) ? "`abstract`" :"`sealed`"} keyword *"
            ));
    }

    builder.declareInType(DeclarationCode.fromParts([
    "  static ",
    "${clazz.identifier.name}? ",
    "_singleton;",
    "\n",
    "  factory ${clazz.identifier.name}()",
    "{\n    _singleton ??= ${clazz.identifier.name}._();",
    "\n    return _singleton!; \n  } \n  ",
    "${clazz.identifier.name}._();"
    ]));
  }
  
  
}

