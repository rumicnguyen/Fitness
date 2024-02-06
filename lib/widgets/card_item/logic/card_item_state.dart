import 'package:equatable/equatable.dart';

import 'package:fitness_app/src/network/model/common/handle.dart';

class CardItemState extends Equatable {
  final String thumbnail;
  final MHandle handle;
  const CardItemState({
    required this.thumbnail,
    required this.handle,
  });

  factory CardItemState.ds() => CardItemState(thumbnail: '', handle: MHandle());

  CardItemState copyWith({
    String? thumbnail,
    MHandle? handle,
  }) {
    return CardItemState(
      thumbnail: thumbnail ?? this.thumbnail,
      handle: handle ?? this.handle,
    );
  }

  @override
  List<Object> get props => [thumbnail, handle];
}
