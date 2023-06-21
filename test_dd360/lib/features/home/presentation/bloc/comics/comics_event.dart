part of 'comics_bloc.dart';

abstract class ComicsEvent extends Equatable {
  const ComicsEvent();

  @override
  List<Object?> get props => [];
}

class ComicsGetEvent extends ComicsEvent {
  final String id;
  const ComicsGetEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
