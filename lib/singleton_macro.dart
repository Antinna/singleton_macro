import 'dart:async';
import 'package:macros/macros.dart';



/// @Singleton()
/// class Class {
///   String name = "foo";
/// }


/// void main(List<String> args) {
/// final instence = Class();
///   print(instence.name);
///    final instence2 = Class();
///    instence2.name = "bar";
///     print(instence.name);
/// }
macro class Singleton implements ClassDeclarationsMacro
 {
  const Singleton();

  @override
  FutureOr<void> buildDeclarationsForClass(
    ClassDeclaration clazz,
    MemberDeclarationBuilder builder,
  ) async {
     final defaultClassConstructor = await builder.constructorsOf(clazz);
    if (defaultClassConstructor.isNotEmpty) {
            builder.report(  Diagnostic( DiagnosticMessage(
              '<= * Remove This ${clazz.identifier.name}() constructor; *, A default factory singleton constructor was created with Macros  , Please Remove this constructor line having Name: ${clazz.identifier.name}',
              target: defaultClassConstructor.first.asDiagnosticTarget,
            ),
            Severity.error,));
      
    }

    builder.declareInType(DeclarationCode.fromParts([
      "  static ",
      "final ",
    "${clazz.identifier.name} ",
    "_singleton = ",
    "${clazz.identifier.name}._internal();\n",
    "  factory ${clazz.identifier.name}() => _singleton;\n",
    "${clazz.identifier.name}._internal();"
    ]));
  }
  
  
}