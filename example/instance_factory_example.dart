import 'dart:mirrors';

import 'package:instance_factory/src/models/strava.dart';

void main() {
  final String name = 'Strava';
  ClassMirror classMirror = findClassMirror('${name}Binder');
  final stravaBinder = classMirror.newInstance(Symbol(''), []).reflectee;
  print(stravaBinder.runtimeType);
}

ClassMirror findClassMirror(String name) {
  for (var lib in currentMirrorSystem().libraries.values) {
    var mirror = lib.declarations[MirrorSystem.getSymbol(name)];
    if (mirror != null) return mirror;
  }
  throw new ArgumentError("Class $name does not exist");
}
