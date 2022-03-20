#!/bin/bash -ex

### フォーマットやテストを実行します。

flutter format lib/*
flutter format test/*
flutter format integration_test/*

flutter pub run build_runner build --delete-conflicting-outputs

flutter analyze

flutter test
