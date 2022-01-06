import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'index_control_state.dart';

class IndexControlCubit extends Cubit<IndexControlState> {
  IndexControlCubit() : super(IndexControlInitial());

  final _carouselIndexController = BehaviorSubject<int>.seeded(0);

  Stream<int> get indexStream => _carouselIndexController.stream;

  Function(int) get updateIndex => _carouselIndexController.sink.add;

  @override
  Future<void> close() {
    _carouselIndexController.close();
    return super.close();
  }
}
