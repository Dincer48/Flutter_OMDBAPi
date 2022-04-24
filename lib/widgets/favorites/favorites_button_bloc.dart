import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

import 'favorite_button_state.dart';

class FavoritesButtonBloc extends Cubit<FavoriteButtonState> {
  FavoritesButtonBloc() : super(FavoriteButtonState.initial());

  void init(String id) {
    var box = Hive.box('Favorites');
    var value = box.containsKey(id);

    if (value) {
      emit(state.copyWith(isLiked: true));
    } else {
      emit(state.copyWith(isLiked: false));
    }
  }

  void like({
    required String id,
    required String title,
    required String poster,
    required double rating,
    required String type,
    required String date,
  }) {
    var box = Hive.box('Favorites');
    if (state.isLiked) {
      box.delete(id);
      emit(state.copyWith(isLiked: false));
    } else {
      emit(state.copyWith(isLiked: true));

      box.put(id, {
        'id': id,
        'title': title,
        'poster': poster,
        'rating': rating,
        'type': type,
        'date': date,
      });
    }
  }
}
