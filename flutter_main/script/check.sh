#!/bin/bash -ex

### フォーマットやテストを実行します。
### TODO インテグレーションテストはちょっとどうしましょうかね？

flutter format lib/*
flutter format test/*
flutter format integration_test/*

flutter test test/*
