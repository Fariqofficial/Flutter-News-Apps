import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  //Untuk menampilkan home page sebagai default
  PageCubit() : super(0);

  void setPage(int newPage) {
    emit(newPage);
  }
}
