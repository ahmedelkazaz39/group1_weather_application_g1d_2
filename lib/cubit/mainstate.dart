import 'package:freezed_annotation/freezed_annotation.dart';
part 'mainstate.freezed.dart';

@freezed
class MainState<T> with _$MainState<T> {
  const factory MainState.initial() = _Initial;
  const factory MainState.loading() = Loading;
  const factory MainState.success(T data) = Success<T>;
  const factory MainState.error({required String error}) = Error;
}
