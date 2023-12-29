// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_screen_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension DetailScreenStatusMatch on DetailScreenStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == DetailScreenStatus.initial) {
      return initial();
    }

    if (v == DetailScreenStatus.loading) {
      return loading();
    }

    if (v == DetailScreenStatus.success) {
      return success();
    }

    if (v == DetailScreenStatus.error) {
      return error();
    }

    throw Exception(
        'DetailScreenStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == DetailScreenStatus.initial && initial != null) {
      return initial();
    }

    if (v == DetailScreenStatus.loading && loading != null) {
      return loading();
    }

    if (v == DetailScreenStatus.success && success != null) {
      return success();
    }

    if (v == DetailScreenStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
