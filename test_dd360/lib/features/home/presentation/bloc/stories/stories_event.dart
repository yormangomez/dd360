part of 'stories_bloc.dart';

abstract class StoriesEvent extends Equatable {
  const StoriesEvent();

  @override
  List<Object?> get props => [];
}

class StoriesGetEvent extends StoriesEvent {
  final String id;
  const StoriesGetEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
