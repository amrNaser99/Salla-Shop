import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Module/search/search_cubit/search_states.dart';
import 'package:shop_app/model/search_model.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel ;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        "text": text
      }
    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);
      print('length of Search model ${searchModel!.data!.data!.length}');
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState(error.toString()));
    });
  }
}
