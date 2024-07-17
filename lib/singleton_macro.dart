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
    " {\n    if (_singleton == null) ",
    "{ \n      _singleton = ${clazz.identifier.name}._();",
    " \n    } \n    return _singleton!; \n  } \n\n  ",
    "${clazz.identifier.name}._();"
    ]));
  }
  
  
}