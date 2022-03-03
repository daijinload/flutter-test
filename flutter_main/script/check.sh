#!/bin/bash -ex

### フォーマットやテストを実行します。

flutter format lib/*
flutter format test/*
flutter format integration_test/*

flutter test
