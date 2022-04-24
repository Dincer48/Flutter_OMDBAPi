import 'package:equatable/equatable.dart';

class FavoriteButtonState extends Equatable {
  final bool isLiked;
  const FavoriteButtonState(
    this.isLiked,
  );
  factory FavoriteButtonState.initial() => const FavoriteButtonState(false);

  FavoriteButtonState copyWith({
    bool? isLiked,
  }) {
    return FavoriteButtonState(
      isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [isLiked];
}
