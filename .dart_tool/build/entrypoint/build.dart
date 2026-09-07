// @dart=3.6
// ignore_for_file: type=lint
// build_runner >=2.4.16
import 'dart:io' as _io;
import 'package:build_runner/src/build_plan/builder_factories.dart'
    as _build_runner;
import 'package:build_runner/src/bootstrap/processes.dart' as _build_runner;
import 'package:dart_mappable_builder/dart_mappable_builder.dart' as _i1;
import 'package:flutter_gen_runner/flutter_gen_runner.dart' as _i2;
import 'package:freezed/builder.dart' as _i3;
import 'package:mockito/src/builder.dart' as _i4;
import 'package:retrofit_generator/retrofit_generator.dart' as _i5;
import 'package:riverpod_generator/builder.dart' as _i6;
import 'package:source_gen/builder.dart' as _i7;

final _builderFactories = _build_runner.BuilderFactories(
  {
    'dart_mappable_builder:dart_mappable_builder': [_i1.buildMappable],
    'flutter_gen_runner:flutter_gen_runner': [_i2.build],
    'freezed:freezed': [_i3.freezed],
    'mockito:mockBuilder': [_i4.buildMocks],
    'retrofit_generator:retrofit_generator': [_i5.retrofitBuilder],
    'riverpod_generator:riverpod_generator': [_i6.riverpodBuilder],
    'source_gen:combining_builder': [_i7.combiningBuilder],
  },
  postProcessBuilderFactories: {
    'flutter_gen_runner:flutter_gen_runner_post_process': _i2.postProcessBuild,
    'source_gen:part_cleanup': _i7.partCleanup,
  },
);
void main(List<String> args) async {
  _io.exitCode = await _build_runner.ChildProcess.run(
    args,
    _builderFactories,
  )!;
}
